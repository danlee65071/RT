#include "Scene.hpp"

void Scene::InitOpenGL()
{
    if(!glfwInit())
        this->_ErrorExit("GLFW init failed!");
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);
    this->_window = glfwCreateWindow(WIDTH, HEIGHT, "RT", NULL, NULL);
    if (this->_window == nullptr)
        this->_ErrorExit("Failed to create GLFW window");
    glfwMakeContextCurrent(this->_window);
    glewExperimental = GL_TRUE;
    if (glewInit() != GLEW_OK)
        this->_ErrorExit("Failed to initialize GLEW");
    glfwGetFramebufferSize(this->_window, &this->_viewWidth, &this->_viewHeight);
    glViewport(0, 0, this->_viewWidth, this->_viewHeight);
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
}

void Scene::Run()
{
    while(!glfwWindowShouldClose(this->_window))
    {
        glClear(GL_COLOR_BUFFER_BIT);
        glfwPollEvents();
        glfwSwapBuffers(this->_window);
    }
    glfwTerminate();
}

void Scene::_ErrorExit(const std::string& str)
{
    std::cout << str << std::endl;
    glfwTerminate();
    exit(1);
}
