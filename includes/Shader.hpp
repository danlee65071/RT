#pragma once

# include <iostream>
# include <fstream>
# include <sstream>
#define GLEW_STATIC
# include <GL/glew.h>

class Shader
{
    private:
        std::string _filePath;
        std::string _shaderCode;
        GLuint      _program;

        Shader(const Shader& other);
        Shader& operator=(const Shader& other);
    public:
        Shader() = default;
        explicit Shader(const std::string& FilePath);
        ~Shader() = default;

        void SetFilePath(const std::string& FilePath);
        [[nodiscard]] std::string GetFilePath() const;

    private:
        void _readShader();
};
