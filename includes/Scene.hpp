#pragma once

# include <iostream>
# include <fstream>
# include <sstream>

#define GLEW_STATIC
# include <GL/glew.h>
# include <GLFW/glfw3.h>

#define WIDTH 800
#define HEIGHT 600

class Scene
{
    private:
        std::string     _mode;

        GLFWwindow*     _window;
        int             _viewWidth;
        int             _viewHeight;

        GLuint          shaderProgram;
        GLuint          VAO;

        Scene(const Scene& other);
        Scene& operator=(const Scene& other);
    public:
        Scene(const std::string& mode);
        ~Scene() = default;

        void InitOpenGL();
        void Run();
    private:
        void _ErrorExit(const std::string& str);

        void _TriangleTest();
    public:
        void TriangleTestRun();
};