#pragma once

# include <iostream>
# include <fstream>
# include <sstream>
# include <cmath>

#define GLEW_STATIC
# include <GL/glew.h>
# include <GLFW/glfw3.h>

#define WIDTH 800
#define HEIGHT 600

class Scene;

class SceneDestroyer
{
    private:
        Scene* p_instance;
    public:
        ~SceneDestroyer();
        void initialize(Scene* p);
};

class Scene
{
    private:
        static Scene*           p_instance;
        static SceneDestroyer   _destroyer;
        GLFWwindow*             _window;
        int                     _viewWidth;
        int                     _viewHeight;

        GLuint                  shaderProgram;
        GLuint                  VAO;

    protected:
        Scene() {};
        Scene(const Scene&) = delete;
        Scene& operator=(Scene&) = delete;
        ~Scene(){}
        friend class SceneDestroyer;

    public:
        static Scene& getInstance();
        void InitOpenGL();
        void Run();

    private:
        void _ErrorExit(const std::string& str);

        void _TriangleTest();

    public:
        void TriangleTestRun();
};
