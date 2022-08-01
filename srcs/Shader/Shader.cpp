#include "Shader.hpp"

Shader::Shader(const std::string& FilePath): _filePath(FilePath) {}

void Shader::SetFilePath(const std::string& FilePath)
{
    this->_filePath = FilePath;    
}

std::string Shader::GetFilePath() const
{
    return this->_filePath;
}

void Shader::_readShader()
{
    std::ifstream       ShaderFile;
    std::stringstream   ss;

    ShaderFile.open(this->_filePath);
    ss << ShaderFile.rdbuf();
    ShaderFile.close();
    this->_shaderCode = ss.str();
}
