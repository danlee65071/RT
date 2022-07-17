#include "RT.hpp"

int main(int argc, char** argv)
{
    std::string mode;
    if (argc == 2)
        mode = argv[1];
    else
        mode = "";

    Scene& scene = Scene::getInstance();
    scene.InitOpenGL();
    if (mode == "test")
        scene.TriangleTestRun();
    else
        scene.Run();
    return 0;
}
