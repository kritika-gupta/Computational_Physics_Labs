

function y = fric(t,u)
  global omega;
  global beta;
   global f;
  y=zeros(2,1);
  y(1)=u(2);
  y(2)=-1*(omega*omega)*u(1)-(2*beta)*u(2);
   if u(2)>0
      y(2)=y(2)-f;
  elseif u(2)<0
      y(2)=y(2)+f;
  end
end
