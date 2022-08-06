#include "Scene.hpp"

Scene* Scene::p_instance = 0;
SceneDestroyer Scene::_destroyer;

SceneDestroyer::~SceneDestroyer()
{
    delete p_instance;
}

void SceneDestroyer::initialize(Scene* p)
{
    p_instance = p;
}

Scene& Scene::getInstance()
{
    if (!p_instance)
    {
        p_instance = new Scene();
        _destroyer.initialize(p_instance);
    }
    return *p_instance;
}

void Scene::InitOpenGL()
{
    if(!glfwInit())
        _ErrorExit("GLFW init failed!");
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);
    _window = glfwCreateWindow(WIDTH, HEIGHT, "RT", NULL, NULL);
    if (_window == nullptr)
        _ErrorExit("Failed to create GLFW window");
    glfwMakeContextCurrent(_window);
    glewExperimental = GL_TRUE;
    if (glewInit() != GLEW_OK)
        _ErrorExit("Failed to initialize GLEW");
    glfwGetFramebufferSize(_window, &_viewWidth, &_viewHeight);
    glViewport(0, 0, _viewWidth, _viewHeight);
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
}

void Scene::Run()
{
    while(!glfwWindowShouldClose(_window))
    {
        glClear(GL_COLOR_BUFFER_BIT);
        glfwPollEvents();
        glfwSwapBuffers(_window);
    }
    glfwTerminate();
}

void Scene::_ErrorExit(const std::string& str)
{
    std::cout << str << std::endl;
    glfwTerminate();
    exit(1);
}

void Scene::LoadShader(const std::string& ShaderFile)
{
    this->_shader.SetFilePath(ShaderFile);
    this->_shader.ReadShader();
}

void Scene::_setShaderCode()
{
    this->_shaderCode = this->_shader.GetShaderCode();
}

GLuint Scene::BuildShader(const std::string& ShaderCode, GLenum ShaderType)
{
    GLuint          shader;
    GLint          status;
    GLchar          info[512];
    const GLchar*   CShaderCode = ShaderCode.c_str();

    shader = glCreateShader(ShaderType);
    glShaderSource(shader, 1, &CShaderCode, NULL);
    glCompileShader(shader);
    glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
    if (!status)
    {
        glGetShaderInfoLog(shader, 512, NULL, info);
        std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << info << std::endl;
    }
    return shader;
}
