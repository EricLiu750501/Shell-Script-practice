#!bin/zsh
ass=(a1 a2 a3 a4)
ppts=$(find . -name "*.pptx" | sort | xargs)
#echo $ppts
cppts=(./a1_學生姓名.pptx ./a2_學生姓名.pptx ./a3_學生姓名.pptx ./a4_學生姓名.pptx)
# inspect ppts have downloaded



# create A1..A4 directory
for i in ${!ass[@]}
do
    if [ ! -d "${ass[$i]}" ]
    then
        mkdir "${ass[$i]}"
    fi
done

# input student name

echo "Enter students' names  (-1 to stop):\n"
read -d "-1" -a name

for hw in ${!ass[@]}
do
    for stu in ${!name[@]}
    do
        if [ ! -d "${ass[$hw]}/${name[$stu]}" ]
        then
            mkdir "${ass[$hw]}/${name[$stu]}"
        fi
        cp -i "${cppts[$hw]}" "${ass[$hw]}/${name[$stu]}/${ass[$hw]}_${name[$stu]}.pptx"
    done
done

if [ ! -d "final" ]
then
    mkdir final
fi

for stu in ${!name[@]}
do
    cp -R "final_test_file" "final/final_test_file_${name[$stu]}"

done
