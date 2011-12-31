//
//  Cube.cpp
//  CubeBuilder
//
//  Created by Kris Temmerman on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#include "Cube.h" 

void Cube::setup(int _index, int posx, int posy,int posz,cbColor _color)
{

    //data = new float[288];
    color =_color;
    cubeIndex = _index;

    pos.set(posx, posy,posz);
    
    cbColor colorTop ;
    colorTop.setID(_index);
   // data =new float[288];
    float gCubeVertexData[288] = 
    {
      
        0.5f+posx, -0.5f+posy, -0.5f+posz,        1.0f, 0.0f, 0.0f,        color.r, color.g, color.b,      110.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, 0.5f+posy, -0.5f+posz,         1.0f, 0.0f, 0.0f,        color.r, color.g, color.b,      110.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, -0.5f+posy, 0.5f+posz,         1.0f, 0.0f, 0.0f,        color.r, color.g, color.b,      110.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, 0.5f+posy, 0.5f+posz,          1.0f, 0.0f, 0.0f,        color.r, color.g, color.b,      110.0f/255.0f, colorTop.g, colorTop.b,
              
  
        -0.5f+posx, 0.5f+posy, -0.5f+posz,        -1.0f, 0.0f, 0.0f,       color.r, color.g, color.b,      120.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, -0.5f+posy, -0.5f+posz,       -1.0f, 0.0f, 0.0f,       color.r, color.g, color.b,      120.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, 0.5f+posy, 0.5f+posz,         -1.0f, 0.0f, 0.0f,       color.r, color.g, color.b,      120.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, -0.5f+posy, 0.5f+posz,        -1.0f, 0.0f, 0.0f,       color.r, color.g, color.b,      120.0f/255.0f, colorTop.g, colorTop.b,
  
        
        0.5f+posx, 0.5f+posy, -0.5f+posz,         0.0f, 1.0f, 0.0f,        color.r, color.g, color.b,      130.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, 0.5f+posy, -0.5f+posz,        0.0f, 1.0f, 0.0f,        color.r, color.g, color.b,      130.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, 0.5f+posy, 0.5f+posz,          0.0f, 1.0f, 0.0f,        color.r, color.g, color.b,      130.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, 0.5f+posy, 0.5f+posz,         0.0f, 1.0f, 0.0f,        color.r, color.g, color.b,      130.0f/255.0f, colorTop.g, colorTop.b,
        
        
        -0.5f+posx, -0.5f+posy, -0.5f+posz,       0.0f, -1.0f, 0.0f,       color.r, color.g, color.b,      140.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, -0.5f+posy, -0.5f+posz,        0.0f, -1.0f, 0.0f,       color.r, color.g, color.b,      140.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, -0.5f+posy, 0.5f+posz,        0.0f, -1.0f, 0.0f,       color.r, color.g, color.b,      140.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, -0.5f+posy, 0.5f+posz,         0.0f, -1.0f, 0.0f,       color.r, color.g, color.b,      140.0f/255.0f, colorTop.g, colorTop.b,
        
        0.5f+posx, 0.5f+posy, 0.5f+posz,          0.0f, 0.0f, 1.0f,        color.r, color.g, color.b,      150.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, 0.5f+posy, 0.5f+posz,         0.0f, 0.0f, 1.0f,        color.r, color.g, color.b,      150.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, -0.5f+posy, 0.5f+posz,         0.0f, 0.0f, 1.0f,        color.r, color.g, color.b,      150.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, -0.5f+posy, 0.5f+posz,        0.0f, 0.0f, 1.0f,        color.r, color.g, color.b,      150.0f/255.0f, colorTop.g, colorTop.b,
        
        0.5f+posx, -0.5f+posy, -0.5f+posz,        0.0f, 0.0f, -1.0f,       color.r, color.g, color.b,      160.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, -0.5f+posy, -0.5f+posz,       0.0f, 0.0f, -1.0f,       color.r, color.g, color.b,      160.0f/255.0f, colorTop.g, colorTop.b,
        0.5f+posx, 0.5f+posy, -0.5f+posz,         0.0f, 0.0f, -1.0f,       color.r, color.g, color.b,      160.0f/255.0f, colorTop.g, colorTop.b,
        -0.5f+posx, 0.5f+posy, -0.5f+posz,        0.0f, 0.0f, -1.0f,       color.r, color.g, color.b,      160.0f/255.0f, colorTop.g, colorTop.b,
    };
  
    
    memcpy(data, &gCubeVertexData[0], 288*sizeof(float));
   
   
}

void Cube::setCubeIndex(int index)
{


};
void  Cube::setCubeColor(cbColor color)
{


}