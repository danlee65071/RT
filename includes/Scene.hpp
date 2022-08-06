#pragma once

# include <iostream>
# include <fstream>
# include <sstream>
# include <cmath>

#define GLEW_STATIC
# include <GL/glew.h>
# include <GLFW/glfw3.h>

# include "Shader.hpp"

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
        Shader                  _shader;
        std::string             _shaderCode;

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
        void LoadShader(const std::string& ShaderFile);
        void Run();

    private:
        void _ErrorExit(const std::string& str);
        void _setShaderCode();

        void _TriangleTest();
        void _SphereTest();
    public:
        void TriangleTestRun();
};
