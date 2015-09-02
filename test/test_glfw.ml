
open Tgl4

let () =
  let _ = Glfw.init () in
  let win = Glfw.create_window 800 600 "GLFW OCaml Demo" Glfw.null Glfw.null in
  Glfw.make_context_current win;
  Glfw.swap_interval 0;
  while not (Glfw.window_should_close win <> 0) do
    Gl.viewport 0 0 800 600;
    Gl.clear_color 0.5 0.5 0.9 1.;
    Gl.clear Gl.color_buffer_bit;

    (* ... *)

    Glfw.swap_buffers win;
    Glfw.poll_events ();
  done

