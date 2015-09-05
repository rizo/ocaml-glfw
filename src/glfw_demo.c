#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include <GLFW/glfw3.h>
#include <cairo/cairo.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define FONT "Sans Bold 18"
#define TEXT "The quick brown fox is so かわいい!"

static void error_callback(int error, const char* description) {
    fputs(description, stderr);
}

static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GL_TRUE);
}


void init_gl() {
        glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
        glClear(GL_COLOR_BUFFER_BIT);

        glDisable (GL_DEPTH_TEST);
        /* glEnable (GL_BLEND); */
        /* glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); */
        glEnable (GL_TEXTURE_2D);

        glClearColor (0.0f, 0.0f, 0.0f, 0.2f);
        glMatrixMode(GL_PROJECTION);

        float ratio = WINDOW_WIDTH / (float) WINDOW_HEIGHT;
        glLoadIdentity();
        glOrtho(-ratio, ratio, -1.f, 1.f, 1.f, -1.f);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        glRotatef((float) glfwGetTime() * 50.f, 0.f, 0.f, 1.f);
}

void draw_triangle() {
        glBegin(GL_TRIANGLES);
        glColor3f(1.f, 0.f, 0.f);
        glVertex3f(-0.6f, -0.4f, 0.f);
        glColor3f(0.f, 1.f, 0.f);
        glVertex3f(0.6f, -0.4f, 0.f);
        glColor3f(0.f, 0.f, 1.f);
        glVertex3f(0.f, 0.6f, 0.f);
        glEnd();
}

void
init_gl_ ()
{
    glClearColor (0.0f, 0.0f, 0.0f, 0.0f);
    glDisable (GL_DEPTH_TEST);
    glEnable (GL_BLEND);
    glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable (GL_TEXTURE_2D);
    glViewport (0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    glMatrixMode (GL_PROJECTION);
    glLoadIdentity ();
    glOrtho (0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, -1, 1);
    glMatrixMode (GL_MODELVIEW);
    glLoadIdentity ();
}

unsigned int
create_texture (unsigned char *data)
{
    unsigned int texture_id;

    glGenTextures (1, &texture_id);
    /* glBindTexture (GL_TEXTURE_2D, texture_id); */
    /* glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR); */
    /* glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); */
    glTexImage2D (GL_TEXTURE_2D,
                  0,
                  GL_RGBA,
                  WINDOW_WIDTH,
                  WINDOW_HEIGHT,
                  0,
                  GL_BGRA,
                  GL_UNSIGNED_BYTE,
                  data);

    return texture_id;
}

void
draw_texture (unsigned int texture_id)
{
    /* Render a texture in immediate mode. */
    glMatrixMode (GL_MODELVIEW);
    glLoadIdentity ();
    glClear (GL_COLOR_BUFFER_BIT);
    glPushMatrix ();
    glBindTexture (GL_TEXTURE_2D, texture_id);
    glColor3f (1.f, 1.0f, 1.0f);

    glBegin (GL_QUADS);
    glTexCoord2f (0.0f, 0.0f);
    glVertex2f (0.0f, 0.0f);
    glTexCoord2f (1.0f, 0.0f);
    glVertex2f (WINDOW_WIDTH, 0.0f);
    glTexCoord2f (1.0f, 1.0f);
    glVertex2f (WINDOW_WIDTH , WINDOW_HEIGHT);
    glTexCoord2f (0.0f, 1.0f);
    glVertex2f (0.0f, WINDOW_HEIGHT);
    glEnd ();

    glPopMatrix ();
}


cairo_t*
create_cairo_context (int width,
                      int height,
                      int channels,
                      cairo_surface_t** surf,
                      unsigned char** buffer)
{
    *buffer = calloc (channels * width * height, sizeof (unsigned char));
    *surf = cairo_image_surface_create_for_data (*buffer,
                                                 CAIRO_FORMAT_ARGB32,
                                                 width,
                                                 height,
                                                 channels * width);
    return cairo_create (*surf);
}

static void do_drawing(cairo_t *cr)
{
  cairo_set_source_rgb(cr, 0.6, 0.6, 0.6);
  cairo_set_line_width(cr, 5);

  cairo_rectangle(cr, 20, 20, 120, 80);
  cairo_rectangle(cr, 180, 20, 80, 80);
  cairo_stroke_preserve(cr);
  cairo_fill(cr);

  cairo_arc(cr, 330, 60, 40, 0, 2*M_PI);
  cairo_stroke_preserve(cr);
  cairo_fill(cr);

  cairo_arc(cr, 90, 160, 40, M_PI/4, M_PI);
  cairo_close_path(cr);
  cairo_stroke_preserve(cr);
  cairo_fill(cr);

  cairo_translate(cr, 220, 180);
  cairo_scale(cr, 1, 0.7);
  cairo_arc(cr, 0, 0, 50, 0, 2*M_PI);
  cairo_stroke_preserve(cr);
  cairo_fill(cr);
}

int main(void) {

    glfwSetErrorCallback(error_callback);

    if (!glfwInit()) {
        exit(EXIT_FAILURE);
    }

    glfwWindowHint(GLFW_ALPHA_BITS, 8);
    GLFWwindow* window = glfwCreateWindow(
            WINDOW_WIDTH,
            WINDOW_HEIGHT,
            "GLFW OCaml Demo",
            NULL,
            NULL);

    if (! window) {
        glfwTerminate();
        exit(EXIT_FAILURE);
    }

    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);
    glfwSetKeyCallback(window, key_callback);

    while (! glfwWindowShouldClose(window)) {
        /* init_gl(); */

        /* unsigned char* surface_data = NULL; */
        /* cairo_surface_t *surface; */
        /* cairo_t *cr; */

        /* surface = cairo_image_surface_create( */
                /* CAIRO_FORMAT_ARGB32, */
                /* WINDOW_WIDTH, */
                /* WINDOW_HEIGHT */
        /* ); */

        /* cr = create_cairo_context( */
                /* WINDOW_WIDTH, */
                /* WINDOW_HEIGHT, */
                /* 4, */
                /* &surface, */
                /* &surface_data */
        /* ); */

        /* glClearColor(0, 0, 0, 0); */
        /* glViewport(0, 0, 640, 480); */

        /* glMatrixMode(GL_PROJECTION); */
        /* glLoadIdentity(); */

        /* glOrtho(0, 640, 480, 0, 1, -1); */

        /* glMatrixMode(GL_MODELVIEW); */

        /* glEnable(GL_TEXTURE_2D); */

        /* glLoadIdentity(); */
        /* glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); */
        /* glLoadIdentity(); */

        /* do_drawing(cr); */

        /* int tex_w = cairo_image_surface_get_width(surface); */
        /* int tex_h = cairo_image_surface_get_height(surface); */
        /* unsigned char* data = cairo_image_surface_get_data(surface); */

        /* int texture_id = create_texture(data); */
        /* draw_texture(texture_id); */

        // OpenGL
        // -----

        // Initialize OpenGL.
        /* glClearColor(0, 150, 0, 0); */
        glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
        /* glMatrixMode(GL_PROJECTION); */
        /* glLoadIdentity(); */
        /* glOrtho(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, 1, -1); */
        /* glMatrixMode(GL_MODELVIEW); */
        /* glEnable(GL_TEXTURE_2D); */
        /* glLoadIdentity(); */

        // Cairo
        // -----

        // Initialize surface and ctx.
 /*        cairo_surface_t *surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32, 120, 120); */
        /* cairo_t *cr = cairo_create (surface); */

        /* // Draw something. */
        /* cairo_set_source_rgb (cr, 0, 0, 255); */
        /* cairo_rectangle (cr, 0.25, 1.0, 0.5, 0.5); */
        /* cairo_fill (cr); */

        /* // Render as opengl texture. */
        /* int img_w = cairo_image_surface_get_width(surface); */
        /* int img_h = cairo_image_surface_get_height(surface); */

        /* void *data = cairo_image_surface_get_data(cairo_get_target(cr)); */
        /* [> unsigned char* data = cairo_image_surface_get_data(surface); <] */

        /* cairo_surface_flush(cairo_get_target(cr)); */

        /* glTexImage2D( */
                /* GL_TEXTURE_2D, */
                /* 0, */
                /* GL_RGBA, */
                /* img_w, */
                /* img_h, 0, */
                /* GL_BGRA, */
                /* GL_UNSIGNED_BYTE, */
                /* data */
        /* ); */

        /* [> glTexImage2D(GL_TEXTURE_2D, 0, 4, img_w, img_h, 0, GL_BGRA, GL_UNSIGNED_BYTE, data); <] */

        /* [> draw_triangle(); <] */

        glfwSwapBuffers(window);
        glfwPollEvents();

        /* free(data); */
        /* cairo_destroy(cr); */
        /* cairo_surface_destroy(surface); */
    }

    glfwDestroyWindow(window);
    glfwTerminate();
    exit(EXIT_SUCCESS);
}

