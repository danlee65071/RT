#include "Shader.hpp"

Shader::Shader(const std::string& FilePath): _filePath(FilePath)
{}

void Shader::SetFilePath(const std::string& FilePath)
{
    this->_filePath = FilePath;    
}

std::string Shader::GetFilePath() const
{
    return this->_filePath;
}

void Shader::ReadShader()
{
    std::ifstream       ShaderFile(this->_filePath, std::ios::in);
    std::stringstream   ss;

    ss << ShaderFile.rdbuf();
    this->_shaderCode = ss.str();
    ShaderFile.close();
}

std::string Shader::GetShaderCode() const
{
    return this->_shaderCode;
}
