
%Removing outliers and readjusting vector length.
[ra2,dec2]=vectorreadjust(ra,dec);

%Removal of outliers of b and v and readjusting length.

k=0;
for i=1:length(b_i)
    if (b_i(i)== -99.990)
        k=k+1;
    end
end
temp_b=zeros(length(b_i)-k,1);
temp_v=zeros(length(v_i)-k,1);
z=1;
for i=1:length(b_i)
    if (b_i(i)== -99.990)
        continue;
    else
        temp_b(z)=b_i(i);
        temp_v(z)=v_i(i);
        z=z+1;
    end
end
[temp_b,temp_v]=vectorreadjust(temp_b,temp_v);
b_f=zeros(length(temp_b)+k,1);
v_f=zeros(length(temp_v)+k,1);
for i=1:length(temp_b)+k
    if (i<=length(temp_b))
        b_f(i)=temp_b(i);
        v_f(i)=temp_v(i);
    else
        b_f(i)= -99.990;
        v_f(i)= -99.990;
    end
end

%Removal of outliers of pmra and pmdec and readjustment of length.

k=0;
for i=1:length(pmra_i)
    if (pmra_i(i)==9999.90 )
        k=k+1;
    end
end
temp_pmra=zeros(length(pmra_i)-k,1);
temp_pmdec=zeros(length(pmdec_i)-k,1);
z=1;
for i=1:length(pmra_i)
    if (pmra_i(i)== 9999.90)
        continue;
    else
        temp_pmra(z)=pmra_i(i);
        temp_pmdec(z)=pmdec_i(i);
        z=z+1;
    end
end
[temp_pmra,temp_pmdec]=vectorreadjust(temp_pmra,temp_pmdec);
pmra_f=zeros(length(temp_pmra)+k,1);
pmdec_f=zeros(length(temp_pmdec)+k,1);
for i=1:length(temp_pmra)+k
    if (i<=length(temp_pmra))
        pmra_f(i)=temp_pmra(i);
        pmdec_f(i)=temp_pmdec(i);
    else
        pmra_f(i)= 9999.90;
        pmdec_f(i)= 9999.90;
    end
end
