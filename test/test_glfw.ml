
open Tgl4

let fmt = Printf.sprintf

let () =
  let init_status = Glfw.init () in
  print_endline (fmt "init_status: %d" init_status);
  (if init_status <> 1 then
    exit 1);

  Glfw.window_hint Glfw.context_version_major 3;
  Glfw.window_hint Glfw.context_version_minor 2;
  Glfw.window_hint Glfw.opengl_forward_compat 1;
  Glfw.window_hint Glfw.opengl_profile Glfw.opengl_core_profile;

  let win = Glfw.create_window 800 600 "GLFW OCaml Demo" Glfw.null Glfw.null in
  (if win = Glfw.null then
     (Glfw.terminate ();
      exit 1));

  Glfw.make_context_current win;
  Glfw.swap_interval 0;
  while not (Glfw.window_should_close win <> 0) do
    Gl.viewport 0 0 800 600;
    Gl.clear_color 0.5 0.5 0.9 1.;
    Gl.clear Gl.color_buffer_bit;

    let (x, y) = Glfw.get_cursor_pos win in
    print_endline (fmt "cursor x = %f, y = %f" x y);

    Glfw.swap_buffers win;
    Glfw.poll_events ();
  done

