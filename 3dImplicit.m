clear
syms u v
R = 2; r=1;
sx(u,v)=(R+r*cos(v))*cos(u);
sy(u,v)=(R+r*cos(v))*sin(u);
sz(u,v)=r*sin(v);
fsurf(sx,sy,sz,[0 2*pi 0 2*pi],'y' );
axis equal
u0= pi/2;
v0 = pi/4;
P = [sx(u0,v0),sy(u0,v0),sz(u0,v0)];
hold on
plot3(P(1),P(2),P(3),'r*','MarkerSize',8)

cx(u) = sx(u,v0);
cy(u) = sy(u,v0);
cz(u) = sz(u,v0);
fplot3(cx,cy,cz,[0 2*pi],'b','LineWidth',3);

dx(v)=sx(u0,v);
dy(v)=sy(u0,v);
dz(v)=sz(u0,v);
fplot3(dx,dy,dz,[0 2*pi], 'm', 'LineWidth',3)

cxd(u) = diff(cx,u);
cyd(u) = diff(cy, u);
czd(u) = diff(cz, u);
cv = [cxd(u0) , cyd(u0), czd(u0)];

quiver3(P(1),P(2),P(3), cv(1), cv(2), cv(3), 'LineWidth', 3);

dxd(v) = diff(dx,v);
dyd(v) = diff(dy, v);
dzd(v) = diff(dz, v);
dv = [dxd(v0) , dyd(v0), dzd(v0)];

quiver3(P(1),P(2),P(3), dv(1), dv(2), dv(3), 'LineWidth', 3);

normVec = cross(cv,dv);
quiver3(P(1),P(2),P(3), normVec(1), normVec(2), normVec(3), 'LineWidth', 3);

syms b3 b2 b1 b0
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
yd(t) = diff(y,t);
ey = [y(t1) == py(1), y(t2) == py(2), yd(t1) == vy(1), yd(t2) == vy(t2)];
cy(t) = subs(y, [b3 b2 b1 b0], [sy.b3 sy.b2 sy.b1 sy.b0]);
fplot(cx, cy, [t1 t2])


