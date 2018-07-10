
open Tgl4

let fmt = Printf.sprintf

let () =
  let init_status = Glfw.init () in
  print_endline (fmt "init_status: %d" init_status);
  (if init_status <> Glfw.true_ then
     exit 1);

  Glfw.window_hint Glfw.context_version_major 3;
  Glfw.window_hint Glfw.context_version_minor 2;
  Glfw.window_hint Glfw.opengl_forward_compat 1;
  Glfw.window_hint Glfw.opengl_profile Glfw.opengl_core_profile;

  let initial_width = 800 in
  let initial_height = 600 in
  let win = Glfw.create_window initial_width initial_height
      "GLFW OCaml Demo" Glfw.null Glfw.null in
  (if win = Glfw.null then
     (Glfw.terminate ();
      exit 1));

  (* Change the background color on framebuffer resize. *)
  let on_framebuffer_size win width height =
    let rand () = Random.float 1.0 in
    Gl.viewport 0 0 width height;
    Gl.clear_color (rand ()) (rand ()) (rand ()) 1.0 in
  let _ = Glfw.set_framebuffer_size_callback win on_framebuffer_size in

  (* Close the window when escape is pressed. *)
  let on_key_callback win key _ action _ =
    if key = Glfw.key_escape && action = Glfw.press then
      Glfw.set_window_should_close win Glfw.true_ in
  let _ = Glfw.set_key_callback win on_key_callback in

  Glfw.make_context_current win;
  Glfw.swap_interval 0;

  (* Make sure the resize callback is called initially. *)
  Glfw.set_window_size win initial_width initial_height;

  (* Enforce a fixed aspect ratio. *)
  Glfw.set_window_aspect_ratio win initial_width initial_height;

  while not (Glfw.window_should_close win <> Glfw.false_) do
    Gl.clear Gl.color_buffer_bit;

    let (x, y) = Glfw.get_cursor_pos win in
    print_endline (fmt "cursor x = %f, y = %f" x y);

    Glfw.swap_buffers win;
    Glfw.poll_events ();
  done

