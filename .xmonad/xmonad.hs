-----------------
---- IMPORTS ----
-----------------


import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Spacing

import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.Run (spawnPipe)
import System.IO (hPutStrLn)

import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

--

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth   = 3

myModMask       = mod4Mask
myTerminal      = "kitty"

-- 
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#005577"

------------------------------------------------------------------
--  ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ███████╗
--  ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
--  █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
--  ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
--  ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝███████║
--  ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
------------------------------------------------------------------
-----------launch apps
    [ ((modm ,              xK_Return), spawn $ XMonad.terminal conf)

    , ((modm,               xK_p     ), spawn "dmenu_run")

    , ((modm,               xK_r     ), spawn "/home/ayoub/.config/rofi/launchers/type-6/launcher.sh")

    , ((modm,               xK_e     ), spawn "nautilus")
    , ((modm,               xK_b     ), spawn "brave")

----------------
-----------control windows
 --resize windows    
      , ((modm .|. shiftMask,    xK_Left      ), sendMessage Shrink)
      , ((modm .|. shiftMask,    xK_Right     ), sendMessage Expand)

 --move focus
      , ((modm,               xK_Right     ), windows W.focusDown)
      , ((modm,               xK_Left      ), windows W.focusUp )

 -- Push window back into tiling
      , ((modm,               xK_v     ), withFocused $ windows . W.sink)
      
 -- close focused window
      , ((modm,               xK_c     ), kill)

-----------
-- bsp

     --resize
 , ((modm .|. shiftMask, xK_Right), sendMessage $ ExpandTowards R) -- Expand window to the right
 , ((modm .|. shiftMask, xK_Left), sendMessage $ ExpandTowards L) -- Expand window to the left
 , ((modm .|. shiftMask, xK_Down), sendMessage $ ExpandTowards D) -- Expand window downwards
 , ((modm .|. shiftMask, xK_Up), sendMessage $ ExpandTowards U) -- Expand window upwards



  , ((modm .|. controlMask, xK_Left), windows W.swapUp)       -- Move window to the left
  , ((modm .|. controlMask, xK_Right), windows W.swapDown)    -- Move window to the right
  , ((modm .|. controlMask, xK_Up), windows W.swapMaster)     -- Move window to the master position
  , ((modm .|. controlMask, xK_Down), withFocused $ \w -> windows $ W.sink w) -- Move window to tiling mode





     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_m), windows W.swapMaster)

    -- Swap the focused window with the next window
--    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
--    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

 
   
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_o, xK_o, xK_o] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
---------------------------------------------------------------
-- ██╗      █████╗ ██╗   ██╗ ██████╗ ██╗   ██╗████████╗███████╗
-- ██║     ██╔══██╗╚██╗ ██╔╝██╔═══██╗██║   ██║╚══██╔══╝██╔════╝
-- ██║     ███████║ ╚████╔╝ ██║   ██║██║   ██║   ██║   ███████╗
-- ██║     ██╔══██║  ╚██╔╝  ██║   ██║██║   ██║   ██║   ╚════██║
-- ███████╗██║  ██║   ██║   ╚██████╔╝╚██████╔╝   ██║   ███████║
-- ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝
---------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--myLayout = avoidStruts (emptyBSP ||| Full  ||| tiled)

myLayout = avoidStruts (spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True emptyBSP ||| Full)
   where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


--------------------------------------------------------------------------------------------------
-- ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗ ██╗   ██╗██╗     ███████╗███████╗
-- ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
-- ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝██║   ██║██║     █████╗  ███████╗
-- ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║ 
-- ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██║  ██║╚██████╔╝███████╗███████╗███████║
--  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
--------------------------------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = insertPosition End Newer <+> composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return()

--------------------------------------------------------------
-- ███████╗████████╗ █████╗ ██████╗ ████████╗██╗   ██╗██████╗ 
-- ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║   ██║██╔══██╗
-- ███████╗   ██║   ███████║██████╔╝   ██║   ██║   ██║██████╔╝
-- ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║   ██║██╔═══╝ 
-- ███████║   ██║   ██║  ██║██║  ██║   ██║   ╚██████╔╝██║     
-- ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     
--------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
      spawnOnce "/home/ayoub/.xmonad/0---scripts/autostart.sh"
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
   xmproc <- spawnPipe "xmobar /home/ayoub/.config/xmobar/dwm"
   xmonad $ docks defaults {
       logHook = dynamicLogWithPP xmobarPP {
         ppOutput = hPutStrLn xmproc,
         ppCurrent = xmobarColor "#ffffff" "#285577"  . pad . pad  , 
         ppVisible = id   . pad . pad ,  
         ppHidden = id   . pad . pad ,
         ppHiddenNoWindows = id  . pad . pad  ,
--       ppWsSep = "",                -- Separator between workspaces
         ppOrder = \(ws:_:t:_) -> [ws, t],     -- Show only workspaces
         ppTitle = xmobarColor "#ffffff" "#285577"  . pad . pad . shorten 100,

  }        
 }   






-- xmonad $ docks defaults  

 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook

      -- what i manualy add
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
