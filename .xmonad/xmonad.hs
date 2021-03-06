--  ___ ___                                __ 
-- |   |   |.--------.-----.-----.---.-.--|  |
-- |-     -||        |  _  |     |  _  |  _  |
-- |___|___||__|__|__|_____|__|__|___._|_____|

-- IMPORTS {{{

import Data.Monoid
import qualified Data.Map as M
import qualified Codec.Binary.UTF8.String as UTF8
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.StackSet as W
import System.Exit
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.MouseResize
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks 
import XMonad.Layout.Accordion
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

-- }}}

-- SETTINGS {{{

myTerminal      = "urxvt"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth :: Dimension
myBorderWidth = 2         

myModMask       = mod4Mask

myWorkspaces = [" DEV ", " WWW ", " SYS ", " DOC ", " VBOX ", " CHAT ", " MUS ", " VID ", " GFX "]

myNormalBorderColor :: String
myNormalBorderColor  = "#2E3440"

myFocusedBorderColor :: String
myFocusedBorderColor = "#FFFFFF"

-- }}}

-- KEY BINDINGS {{{

myKeys :: [(String, X ())]
myKeys =
    -- APPLICATIONS BINDINGS:
    -- launch a terminal
    [ ("M-<Return>", spawn $ XMonad.terminal conf)

    -- launch ranger
    , ("M-M1-r", spawn "urxvt -e ranger")

    -- launch nvim
    ,("M-M1-n", spawn "urxvt -e nvim")

    -- launch config menu
    , ("M-e", spawn "./.config/rofi/scripts/rofi-configmenu.sh")

    -- launch scrot menu
    ,("M-S-<xK_Print>", spawn "./.config/rofi/scripts/rofi-scrotmenu.sh")

    -- take screenshot
    ,("M-<xK_Print>", spawn "scrot -e 'mv $f ~/Pictures/Scrot/'")

    -- launch rofi
    , ("M-d", spawn "rofi -show drun")

    -- close focused window
    , ("M-q", kill)

    -- Rotate through the available layout algorithms
    , ("M-<xK_Tab>", sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ("M-S-<xK_Tab>", setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ("M-n", refresh)

    -- Move focus to the next window
    , ("M-j", windows W.focusDown)

    -- Move focus to the previous window
    , ("M-k", windows W.focusUp  )

    -- Move focus to the master window
    , ("M-m", windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ("M-S-s", windows W.swapMaster)

    -- Swap the focused window with the next window
    , ("M-S-j", windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ("M-S-k", windows W.swapUp    )

    , ("M-M1-h", sendMessage Shrink)                   -- Shrink horiz window width
    , ("M-M1-l", sendMessage Expand)                   -- Expand horiz window width
    , ("M-M1-j", sendMessage MirrorShrink)          -- Shrink vert window width
    , ("M-M1-k", sendMessage MirrorExpand)          -- Expand vert window width

    -- Push window back into tiling
    , ("M-t", withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ("M-S-<xK_comma>", sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ("M-S-<xK_comma>", sendMessage (IncMasterN (-1)))

    -- Quit xmonad
    , ("M-S-q", io (exitWith ExitSuccess))

    -- Restart xmonad
    , ("M-S-r", spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- }}}

-- LAYOUTS {{{

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

tall     = renamed [Replace "tall"]
           $ windowNavigation
           $ limitWindows 12
           $ mySpacing 5
           $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
           $ windowNavigation
           $ limitWindows 20 Full
floats   = renamed [Replace "floats"]
           $ limitWindows 20 simplestFloat
grid     = renamed [Replace "grid"]
           $ windowNavigation
           $ limitWindows 12
           $ mySpacing 5
           $ mkToggle (single MIRROR)
           $ Grid (16/10)
tallAccordion  = renamed [Replace "tallAccordion"]
           $ mySpacing 5
           $ Accordion
wideAccordion  = renamed [Replace "wideAccordion"]
           $ mySpacing 5
           $ Mirror Accordion

myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats
               $ myDefaultLayout where
               myDefaultLayout = withBorder myBorderWidth tall
			   ||| Mirror tall
			   ||| floats
			   ||| noBorders monocle
			   ||| grid
			   ||| tallAccordion
			   ||| wideAccordion

-- }}}

-- WINDOW RULES {{{

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

-- }}}

-- EVENT HANDLING {{{

myEventHook = mempty

-- }}}

-- STATUS BARS AND LOGGING {{{

-- myLogHook dbus = 

-- }}}

-- STARTUP HOOK {{{

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom --experimental-backends &"
    spawnOnce "nm-applet &"
    spawnOnce "volumeicon &"
    -- spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 22 &"
    spawnOnce "urxvtd -q -o -f &"     
    spawnOnce "nitrogen --restore &" 

-- }}}

-- OTHERS {{{

main :: IO ()
main = do
	xmonad $ docks defaults
	xmproc <- spawnPipe "xmobar -x 0 /home/dilip/.xmonad/xmobarrc"

defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- hooks, layouts
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook <+> manageDocks ,
        handleEventHook    = myEventHook,
        logHook			   = dynamicLogWithPP $ xmobarPP
              -- the following variables beginning with 'pp' are settings for xmobar.
              { ppOutput = \x -> hPutStrLn xmproc x                          -- xmobar on monitor 1
              , ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]"           -- Current workspace
              , ppVisible = xmobarColor "#98be65" "" . clickable              -- Visible but not current workspace
              , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" "" . clickable -- Hidden workspaces
              , ppHiddenNoWindows = xmobarColor "#c792ea" ""  . clickable     -- Hidden workspaces (no windows)
              , ppTitle = xmobarColor "#b3afc2" "" . shorten 60               -- Title of active window
              , ppSep =  "<fc=#666666> <fn=1>|</fn> </fc>"                    -- Separator character
              , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"            -- Urgent workspace
              , ppExtras  = [windowCount]                                     -- # of windows current workspace
              , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]                    -- order of things in xmobar
              },
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys

-- }}}
