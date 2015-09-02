
open Ctypes
open Foreign


type window = unit ptr
let window : window typ = ptr void

type monitor = unit ptr
let monitor : monitor typ = ptr void

let null = Ctypes.null

let error_callback = int @-> string @-> returning void

let key_callback = window @-> int @-> int @-> int @-> int @-> returning void

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

let window_should_close =
  foreign "glfwWindowShouldClose" (window @-> returning int)

let get_framebuffer_size =
  foreign "glfwGetFramebufferSize" (window @-> ptr int @-> ptr int
                                           @-> returning void)

let swap_buffers =
  foreign "glfwSwapBuffers" (window @-> returning void)

let poll_events =
  foreign "glfwPollEvents" (void @-> returning void)

let destroy_window =
  foreign "glfwDestroyWindow" (window @-> returning void)

