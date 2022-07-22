#include "RT.hpp"

int main()
{
    Scene& scene = Scene::getInstance();
    scene.InitOpenGL();
    scene.Run();
    return 0;
}
