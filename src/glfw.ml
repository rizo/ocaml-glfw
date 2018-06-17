
open Ctypes
open Foreign

let version_major        = 3
let version_minor        = 1
let version_revision     = 2

let release              = 0
let press                = 1
let repeat               = 2
let key_unknown          = -1
let key_space            = 32
let key_apostrophe       = 39  (* ' *)
let key_comma            = 44  (* , *)
let key_minus            = 45  (* - *)
let key_period           = 46  (* . *)
let key_slash            = 47  (* / *)
let key_0                = 48
let key_1                = 49
let key_2                = 50
let key_3                = 51
let key_4                = 52
let key_5                = 53
let key_6                = 54
let key_7                = 55
let key_8                = 56
let key_9                = 57
let key_semicolon        = 59  (* ; *)
let key_equal            = 61  (* = *)
let key_a                = 65
let key_b                = 66
let key_c                = 67
let key_d                = 68
let key_e                = 69
let key_f                = 70
let key_g                = 71
let key_h                = 72
let key_i                = 73
let key_j                = 74
let key_k                = 75
let key_l                = 76
let key_m                = 77
let key_n                = 78
let key_o                = 79
let key_p                = 80
let key_q                = 81
let key_r                = 82
let key_s                = 83
let key_t                = 84
let key_u                = 85
let key_v                = 86
let key_w                = 87
let key_x                = 88
let key_y                = 89
let key_z                = 90
let key_left_bracket     = 91
let key_backslash        = 92
let key_right_bracket    = 93
let key_grave_accent     = 96  (* ` *)
let key_world_1          = 161 (* non-US #1 *)
let key_world_2          = 162 (* non-US #2 *)

(* Function keys *)
let key_escape           = 256
let key_enter            = 257
let key_tab              = 258
let key_backspace        = 259
let key_insert           = 260
let key_delete           = 261
let key_right            = 262
let key_left             = 263
let key_down             = 264
let key_up               = 265
let key_page_up          = 266
let key_page_down        = 267
let key_home             = 268
let key_end              = 269
let key_caps_lock        = 280
let key_scroll_lock      = 281
let key_num_lock         = 282
let key_print_screen     = 283
let key_pause            = 284
let key_f1               = 290
let key_f2               = 291
let key_f3               = 292
let key_f4               = 293
let key_f5               = 294
let key_f6               = 295
let key_f7               = 296
let key_f8               = 297
let key_f9               = 298
let key_f10              = 299
let key_f11              = 300
let key_f12              = 301
let key_f13              = 302
let key_f14              = 303
let key_f15              = 304
let key_f16              = 305
let key_f17              = 306
let key_f18              = 307
let key_f19              = 308
let key_f20              = 309
let key_f21              = 310
let key_f22              = 311
let key_f23              = 312
let key_f24              = 313
let key_f25              = 314
let key_kp_0             = 320
let key_kp_1             = 321
let key_kp_2             = 322
let key_kp_3             = 323
let key_kp_4             = 324
let key_kp_5             = 325
let key_kp_6             = 326
let key_kp_7             = 327
let key_kp_8             = 328
let key_kp_9             = 329
let key_kp_decimal       = 330
let key_kp_divide        = 331
let key_kp_multiply      = 332
let key_kp_subtract      = 333
let key_kp_add           = 334
let key_kp_enter         = 335
let key_kp_equal         = 336
let key_left_shift       = 340
let key_left_control     = 341
let key_left_alt         = 342
let key_left_super       = 343
let key_right_shift      = 344
let key_right_control    = 345
let key_right_alt        = 346
let key_right_super      = 347
let key_menu             = 348
let key_last             = key_menu

let mod_shift         = 0X0001
let mod_control       = 0X0002
let mod_alt           = 0X0004
let mod_super         = 0X0008

let mouse_button_1       = 0
let mouse_button_2       = 1
let mouse_button_3       = 2
let mouse_button_4       = 3
let mouse_button_5       = 4
let mouse_button_6       = 5
let mouse_button_7       = 6
let mouse_button_8       = 7
let mouse_button_last    = mouse_button_8
let mouse_button_left    = mouse_button_1
let mouse_button_right   = mouse_button_2
let mouse_button_middle  = mouse_button_3

let joystick_1           = 0
let joystick_2           = 1
let joystick_3           = 2
let joystick_4           = 3
let joystick_5           = 4
let joystick_6           = 5
let joystick_7           = 6
let joystick_8           = 7
let joystick_9           = 8
let joystick_10          = 9
let joystick_11          = 10
let joystick_12          = 11
let joystick_13          = 12
let joystick_14          = 13
let joystick_15          = 14
let joystick_16          = 15
let joystick_last        = joystick_16

let not_initialized      = 0x00010001
let no_current_context   = 0x00010002
let invalid_enum         = 0x00010003
let invalid_value        = 0x00010004
let out_of_memory        = 0x00010005
let api_unavailable      = 0x00010006
let version_unavailable  = 0x00010007
let platform_error       = 0x00010008
let format_unavailable   = 0x00010009

let focused              = 0x00020001
let iconified            = 0x00020002
let resizable            = 0x00020003
let visible              = 0x00020004
let decorated            = 0x00020005
let auto_iconify         = 0x00020006
let floating             = 0x00020007

let red_bits             = 0x00021001
let green_bits           = 0x00021002
let blue_bits            = 0x00021003
let alpha_bits           = 0x00021004
let depth_bits           = 0x00021005
let stencil_bits         = 0x00021006
let accum_red_bits       = 0x00021007
let accum_green_bits     = 0x00021008
let accum_blue_bits      = 0x00021009
let accum_alpha_bits     = 0x0002100A
let aux_buffers          = 0x0002100B
let stereo               = 0x0002100C
let samples              = 0x0002100D
let srgb_capable         = 0x0002100E
let refresh_rate         = 0x0002100F
let doublebuffer         = 0x00021010

let client_api               = 0x00022001
let context_version_major    = 0x00022002
let context_version_minor    = 0x00022003
let context_revision         = 0x00022004
let context_robustness       = 0x00022005
let opengl_forward_compat    = 0x00022006
let opengl_debug_context     = 0x00022007
let opengl_profile           = 0x00022008
let context_release_behavior = 0x00022009

let opengl_api             = 0x00030001
let opengl_es_api          = 0x00030002

let no_robustness          =          0
let no_reset_notification  = 0x00031001
let lose_context_on_reset  = 0x00031002

let opengl_any_profile     =          0
let opengl_core_profile    = 0x00032001
let opengl_compat_profile  = 0x00032002

let cursor                 = 0x00033001
let sticky_keys            = 0x00033002
let sticky_mouse_buttons   = 0x00033003

let cursor_normal          = 0x00034001
let cursor_hidden          = 0x00034002
let cursor_disabled        = 0x00034003

let any_release_behavior   =          0
let release_behavior_flush = 0x00035001
let release_behavior_none  = 0x00035002

let arrow_cursor           = 0x00036001
let ibeam_cursor           = 0x00036002
let crosshair_cursor       = 0x00036003
let hand_cursor            = 0x00036004
let hresize_cursor         = 0x00036005
let vresize_cursor         = 0x00036006
let connected              = 0x00040001
let disconnected           = 0x00040002

let dont_care              = -1

type window = unit ptr
let window : window typ = ptr void

type monitor = unit ptr
let monitor : monitor typ = ptr void

let null = Ctypes.null

let cursor_pos_callback = window @-> float @-> float @-> returning void

let error_callback = int @-> string @-> returning void

let framebuffer_size_callback = window @-> int @-> int @-> returning void

let key_callback = window @-> int @-> int @-> int @-> int @-> returning void

let mouse_button_callback = window @-> int @-> int @-> int @-> returning void

let scroll_callback = window @-> int @-> int @-> returning void

let init =
  foreign "glfwInit" (void @-> returning int)

let set_error_callback =
  foreign "glfwSetErrorCallback" (funptr error_callback @-> returning void)

let window_hint =
  foreign "glfwWindowHint" (int @-> int @-> returning void)

let create_window =
  foreign "glfwCreateWindow" (int @-> int @-> string @-> monitor @-> window
                                  @-> returning window)

let make_context_current =
  foreign "glfwMakeContextCurrent" (window @-> returning void)

let terminate =
  foreign "glfwTerminate" (void @-> returning void)

let swap_interval =
  foreign "glfwSwapInterval" (int @-> returning void)

let set_key_callback =
  foreign "glfwSetKeyCallback" (window @-> funptr key_callback
                                       @-> returning (funptr key_callback))

let set_mouse_button_callback =
  foreign "glfwSetMouseButtonCallback"
    (window @-> funptr mouse_button_callback
            @-> returning (funptr mouse_button_callback))

let set_scroll_callback =
  foreign "glfwSetScrollCallback"
    (window @-> funptr scroll_callback
            @-> returning (funptr scroll_callback))

let get_cursor_pos =
  foreign "glfwGetCursorPos"
    (window @-> ptr float @-> ptr float @-> returning void)
let get_cursor_pos w =
  let x = allocate double 0.0 in
  let y = allocate double 0.0 in
  get_cursor_pos w x y;
  (!@ x, !@ y)

let set_cursor_pos_callback =
  foreign "glfwSetCursorPosCallback"
    (window @-> funptr cursor_pos_callback
            @-> returning (funptr cursor_pos_callback))

let window_should_close =
  foreign "glfwWindowShouldClose" (window @-> returning int)

let set_window_should_close =
  foreign "glfwSetWindowShouldClose" (window @-> int @-> returning void)

let get_framebuffer_size =
  foreign "glfwGetFramebufferSize" (window @-> ptr int @-> ptr int
                                           @-> returning void)
let get_framebuffer_size win =
  let w = allocate int 0 in
  let h = allocate int 0 in
  get_framebuffer_size win w h;
  (!@ w, !@ h)

let get_window_size =
  foreign "glfwGetWindowSize" (window @-> ptr int @-> ptr int
                                      @-> returning void)
let get_window_size win =
  let w = allocate int 0 in
  let h = allocate int 0 in
  get_window_size win w h;
  (!@ w, !@ h)

let set_framebuffer_size_callback =
  foreign "glfwSetFramebufferSizeCallback"
    (window @-> funptr framebuffer_size_callback
            @-> returning (funptr framebuffer_size_callback))

let swap_buffers =
  foreign "glfwSwapBuffers" (window @-> returning void)

let poll_events =
  foreign "glfwPollEvents" (void @-> returning void)

let destroy_window =
  foreign "glfwDestroyWindow" (window @-> returning void)

let set_time =
  foreign "glfwSetTime" (double @-> returning void)

let get_time =
  foreign "glfwGetTime" (void @-> returning double)
