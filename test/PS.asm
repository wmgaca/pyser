//
// Generated by Microsoft (R) HLSL Shader Compiler
//
//
// Buffer Definitions: 
//
// cbuffer cb0
// {
//
//   float4 alphaRefRegister;           // Offset:  256 Size:    16
//   float4 fogColorRegister;           // Offset:  272 Size:    16
//   float4 setConstant0;               // Offset:    0 Size:    16 [unused]
//   float4 setConstant1;               // Offset:   16 Size:    16
//   float4 setConstant2;               // Offset:   32 Size:    16
//
// }
//
//
// Resource Bindings:
//
// Name                   Type  Format         Dim Slot Elements
// ---------------- ---------- ------- ----------- ---- --------
// sampler0            sampler      NA          NA    0        1
// sampler1            sampler      NA          NA    1        1
// texsampler0         texture   float          2d    0        1
// texsampler1         texture   float          2d    1        1
// cb0                 cbuffer      NA          NA    0        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// SV_Position              0   xyzw        0      POS  float       
// FOG                      0   x           1     NONE  float   x   
// TEXCOORD                 0    yzw        1     NONE  float    yz 
// COLOR                    0   xyzw        2     NONE  float   xyzw
// COLOR                    1   xyzw        3     NONE  float   xyz 
// TEXCOORD                 1   xy          4     NONE  float   xy  
// TEXCOORD                 2     zw        4     NONE  float       
// TEXCOORD                 3   xyzw        5     NONE  float   xyzw
// TEXCOORD                 4   xyzw        6     NONE  float       
// TEXCOORD                 5   xy          7     NONE  float       
// TEXCOORD                 6     zw        7     NONE  float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// SV_Target                0   xyzw        0   TARGET  float   xyzw
//
ps_4_0
dcl_input_ps linear v10.x
dcl_input_ps linear v1.yz
dcl_input_ps linear v22.xyzw
dcl_input_ps linear v3.xyz
dcl_input_ps linear v4.xy
dcl_input_ps linear v5.xyzw
dcl_output o0.xyzw
dcl_constantbuffer cb0[18], immediateIndexed
dcl_resource_texture2d (float,float,float,float) t0
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_sampler s1, mode_default
dcl_temps 2
sample r0.xyzw, v4.xyxx, t1.xyzw, s1
dp3 r0.x, v3.xyzx, r0.xyzx
sample r1.xyzw, v1.yzyy, t0.xyzw, s0
dp3 r0.y, v5.xyzx, r1.xyzx
add r0.x, r0.x, r0.y
mul r0.x, r0.x, v5.w
mad r0.xyz, r0.xxxx, cb0[1].xyzx, cb0[2].xyzx
mad r0.xyz, v2.xyzx, r0.xyzx, -cb0[17].xyzx
mov_sat r0.w, v1.x
mad o0.xyz, r0.wwww, r0.xyzx, cb0[17].xyzx
mul r0.x, r1.w, v2.w
mad r0.y, v2.w, r1.w, -cb0[16].w
mov o0.w, r0.x
ult r0.x, l(-2147483648), r0.y
discard r0.x
ret 
// Approximately 16 instruction slots used
