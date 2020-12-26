# 4D Isometric Projection

<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-dmdRWJPVb-Q/XdssOcYzadI/AAAAAAAAAKs/ghB6CU6F-qgRta_2wMX9xgvWZUbqyXh7wCLcBGAsYHQ/s1600/cover.png"></p>

Normal, three-dimensional isometric projection is a method of mapping a three-dimensional space onto a two-dimensional space. 3D isometric projection is useful because the rules are simple, it is relatively trivial to implement, and all importantly it is easy to comprehend once it is implemented. Although there are distortions when going from a true 3D scene to an isometric one, (there is no foreshortening for example) a human brain can look at an isometric projection and easily understand what is going on spatially.

<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-OzkUty6URwo/XdtCsGUn5sI/AAAAAAAAAK4/TbryFU96nVU96TtWUASoOSe5SF-mAEaxQCLcBGAsYHQ/s1600/axis3D.png"></p>

Isometric projection works by forcing the axes of the projection to share with the axis of the true space. For example, in the image above the true axes of the space: x, y and z, are squeezed into the two axis of the projection (x and y). To do this, rather than being perpendicular as true axes are, isometric axes are given by an angle. In this case, an object moving on the z axis would move up and down on the blue and purple vector, moving on the y would go forward and back on the green and cyan, and moving on the x would be forward and back along the red-yellow vector. Any movement along more than one true axis then, would project as moving along each vector added together.

<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-cyGYy-m2U90/XdtFGuvzCVI/AAAAAAAAALE/2NqKWv-UY3Q9HTYwagZyV_i3XpMC6GwVwCLcBGAsYHQ/s1600/cube3D.png"></p>

Because any projected position is represented as moving along straight vectors, it is easy to visualize geometry by drawing 2D lines in between calculated points. For example, the wire-frame cube above was created by drawing straight 2D lines between the eight projected points of the true 3D cube. Additionally, geometry can be easily created by manually entering points. For example, a 3D unit-cube could be made by creating lines between (0, 0, 0), (0, 0, 1), (0, 1, 0), (0, 1 ,1), (1, 0, 0), (1, 0, 1), (1, 1, 0) and (1, 1, 1) isometrically projected.
The reason I explain the details and consequences of isometric projection in such detail here, is that it is important to understand how isometric projection works in three-dimensions before understanding how it works in four. It can also help to understand why isometric projection was chosen by me, as a method of projecting four-dimensional space. Going back to my explanation of squeezing three axes into two, I visualize this by showing three lines crossing each other. There is nothing in the rules of isometric projection that disallows using more than three true dimensions, and this visual explanations expands easily.

<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-H7ZGjsg9xuA/XdtNrG_LjNI/AAAAAAAAALQ/XE1JUJ6aR24P-SwLtW66sBl8vEYwXbaYgCLcBGAsYHQ/s1600/axis4D.png"></p>

Above is the same visualization of axes as seen earlier. The difference of course, is that there are four lines here, representing the four true dimensions being squeezed onto a two dimensional space. In this case, the z axis is the cyan and blue one, the y is light and dark green, the x is red and orange and the forth, w axis is dark and light purple. And because four-dimensional isometric projection is based on the same principles as three-dimensional projection, all the rules of the latter apply to the former. For example, a 4-dimensional, isometric hyper-cube looks like this:

<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-H7ZGjsg9xuA/XdtNrG_LjNI/AAAAAAAAALQ/XE1JUJ6aR24P-SwLtW66sBl8vEYwXbaYgCLcBGAsYHQ/s1600/axis4D.png"></p>

Though this may look like an abstract flower at first, it is possible to make out the eight individual cubes that make up this hyper-cube upon closer inspection. Like the 3D cube, this one was simply made by manual entering 4D coordinates, in this case (0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 1, 0), (0, 0, 1, 1), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 1, 0), (0, 1, 1, 1), (1, 0, 0, 0), (1, 0, 0, 1), (1, 0, 1, 0), (1, 0, 1, 1), (1, 1, 0, 0), (1, 1, 0, 1), (1, 1, 1, 0) and finally (1, 1, 1, 1) for the 4D  unit-hyper-cube.
This method of projection is useful for the same reasons that 3-dimensional projections is useful: the rules behind it are simple, the implementation is only slightly more complicated than in 3D, and most importantly still, it is relatively easy to comprehend. The last point is questionable, as the the image above is hardly an easily understood geometric space; however, compared to other methods of 4D visualization, the simplicity of the isometric method is straightforward. The lack of foreshortening for example, removes spatial distortion, and consistency of angles means that an object's four-dimensional position and size can be estimated with relative ease.
There is more to be said on this method of projection, but this post is already quite lengthy enough. The goal here, was to explain the principles behind this method, as well as showcasing some of the outcome. I'll leave you with a rotating hyper-cube, something that will be discussed further in the future.


<p align="center"><img alt="cover" width=400 height = 400 src="https://1.bp.blogspot.com/-AYOclPFBa1o/Xdtl2RKZIlI/AAAAAAAAALo/QX15OSec1j8514sdGrf8zqYCLFZ3C6cpACLcBGAsYHQ/s1600/rot.gif"></p>
