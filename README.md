A common application for industrial robots and cobots are pick-and-place operations, e.g. as part of an
assembly line or larger automation process. Many of those applications can be pre-programmed, i.e. the
positions and orientations of the parts are known in advance and do not change.
However, for applications such as bin picking where parts are put randomly in a box, vision sensors are
required to recognize objects, localize them and compute a gripper pose. This lab provides an introduction
into vision-based pick-and-place using an Azure Kinect DK camera and a cobot UR5e from Universal Robots.

The goals achivied in this;
a) how to use a 2D colour camera to recognize objects of different colour,
b) how to compute the corresponding gripping pose (position and orientation) on a flat surface,
c) how to implement the pick-and-place application in a simulation environment,
d) how to transfer the application to real hardware, and
e) what challenges for vision applications are to be faced in the real world scenarios
