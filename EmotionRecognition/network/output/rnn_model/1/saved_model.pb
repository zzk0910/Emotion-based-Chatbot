łĄ
ö*Ę*
,
Abs
x"T
y"T"
Ttype:

2	
:
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

B
Equal
x"T
y"T
z
"
Ttype:
2	

)
Exit	
data"T
output"T"	
Ttype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	

GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
$

LogicalAnd
x

y

z

!
LoopCond	
input


output

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2

Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
;
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(

Min

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
;
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
/
Sign
x"T
y"T"
Ttype:

2	
9
Softmax
logits"T
softmax"T"
Ttype:
2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
-
Tanh
x"T
y"T"
Ttype:

2
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype
9
TensorArraySizeV3

handle
flow_in
size
Ž
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("$
identical_element_shapesbool( "
tensor_array_namestring 
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.12.02b'v1.12.0-rc2-3-ga6d8ffae09'ķā

inputsPlaceholder*
dtype0*5
_output_shapes#
!:’’’’’’’’’’’’’’’’’’Č**
shape!:’’’’’’’’’’’’’’’’’’Č
\
GetLength/AbsAbsinputs*
T0*5
_output_shapes#
!:’’’’’’’’’’’’’’’’’’Č
a
GetLength/Max/reduction_indicesConst*
dtype0*
value	B :*
_output_shapes
: 

GetLength/MaxMaxGetLength/AbsGetLength/Max/reduction_indices*
	keep_dims( *
T0*

Tidx0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
`
GetLength/SignSignGetLength/Max*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
a
GetLength/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :

GetLength/SumSumGetLength/SignGetLength/Sum/reduction_indices*
	keep_dims( *

Tidx0*#
_output_shapes
:’’’’’’’’’*
T0
r
GetLength/CastCastGetLength/Sum*
Truncate( *#
_output_shapes
:’’’’’’’’’*

DstT0*

SrcT0
K
ShapeShapeinputs*
out_type0*
_output_shapes
:*
T0
]
strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
_
strided_slice/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
_
strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ł
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
ellipsis_mask *
T0*
new_axis_mask *
shrink_axis_mask*

begin_mask *
_output_shapes
: *
end_mask *
Index0
]
DropoutWrapperInit/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
_
DropoutWrapperInit/Const_1Const*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
DropoutWrapperInit/Const_2Const*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
DropoutWrapperInit_1/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
a
DropoutWrapperInit_1/Const_1Const*
dtype0*
valueB
 *  ?*
_output_shapes
: 
a
DropoutWrapperInit_1/Const_2Const*
_output_shapes
: *
dtype0*
valueB
 *  ?

UDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims/dimConst*
value	B : *
_output_shapes
: *
dtype0
ö
QDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims
ExpandDimsstrided_sliceUDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0

LDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ConstConst*
valueB:@*
_output_shapes
:*
dtype0

RDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0

MDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concatConcatV2QDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDimsLDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ConstRDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0

RDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
»
LDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zerosFillMDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concatRDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros/Const*

index_type0*
T0*'
_output_shapes
:’’’’’’’’’@

WDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_1/dimConst*
dtype0*
value	B : *
_output_shapes
: 
ś
SDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_1
ExpandDimsstrided_sliceWDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_1/dim*
T0*

Tdim0*
_output_shapes
:

NDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/Const_1Const*
_output_shapes
:*
dtype0*
valueB:@

WDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B : 
ś
SDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_2
ExpandDimsstrided_sliceWDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_2/dim*

Tdim0*
T0*
_output_shapes
:

NDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@

TDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

ODropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat_1ConcatV2SDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_2NDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/Const_2TDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat_1/axis*
N*
T0*

Tidx0*
_output_shapes
:

TDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
Į
NDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros_1FillODropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/concat_1TDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*'
_output_shapes
:’’’’’’’’’@

WDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_3/dimConst*
value	B : *
dtype0*
_output_shapes
: 
ś
SDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_3
ExpandDimsstrided_sliceWDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/ExpandDims_3/dim*

Tdim0*
_output_shapes
:*
T0

NDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/Const_3Const*
_output_shapes
:*
dtype0*
valueB:@
V
dynamic_rnn/rnn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
]
dynamic_rnn/rnn/range/startConst*
dtype0*
value	B :*
_output_shapes
: 
]
dynamic_rnn/rnn/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 

dynamic_rnn/rnn/rangeRangedynamic_rnn/rnn/range/startdynamic_rnn/rnn/Rankdynamic_rnn/rnn/range/delta*
_output_shapes
:*

Tidx0
p
dynamic_rnn/rnn/concat/values_0Const*
_output_shapes
:*
dtype0*
valueB"       
]
dynamic_rnn/rnn/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
±
dynamic_rnn/rnn/concatConcatV2dynamic_rnn/rnn/concat/values_0dynamic_rnn/rnn/rangedynamic_rnn/rnn/concat/axis*

Tidx0*
_output_shapes
:*
N*
T0

dynamic_rnn/rnn/transpose	Transposeinputsdynamic_rnn/rnn/concat*
Tperm0*5
_output_shapes#
!:’’’’’’’’’’’’’’’’’’Č*
T0
i
dynamic_rnn/rnn/sequence_lengthIdentityGetLength/Cast*#
_output_shapes
:’’’’’’’’’*
T0
n
dynamic_rnn/rnn/ShapeShapedynamic_rnn/rnn/transpose*
out_type0*
_output_shapes
:*
T0
m
#dynamic_rnn/rnn/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%dynamic_rnn/rnn/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
o
%dynamic_rnn/rnn/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
É
dynamic_rnn/rnn/strided_sliceStridedSlicedynamic_rnn/rnn/Shape#dynamic_rnn/rnn/strided_slice/stack%dynamic_rnn/rnn/strided_slice/stack_1%dynamic_rnn/rnn/strided_slice/stack_2*
new_axis_mask *
Index0*
end_mask *
ellipsis_mask *
T0*

begin_mask *
_output_shapes
: *
shrink_axis_mask
v
dynamic_rnn/rnn/Shape_1Shapedynamic_rnn/rnn/sequence_length*
_output_shapes
:*
out_type0*
T0
v
dynamic_rnn/rnn/stackPackdynamic_rnn/rnn/strided_slice*
_output_shapes
:*
N*
T0*

axis 
s
dynamic_rnn/rnn/EqualEqualdynamic_rnn/rnn/Shape_1dynamic_rnn/rnn/stack*
_output_shapes
:*
T0
_
dynamic_rnn/rnn/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
}
dynamic_rnn/rnn/AllAlldynamic_rnn/rnn/Equaldynamic_rnn/rnn/Const*
	keep_dims( *
_output_shapes
: *

Tidx0

dynamic_rnn/rnn/Assert/ConstConst*
_output_shapes
: *P
valueGBE B?Expected shape for Tensor dynamic_rnn/rnn/sequence_length:0 is *
dtype0
o
dynamic_rnn/rnn/Assert/Const_1Const*
_output_shapes
: *
dtype0*!
valueB B but saw shape: 
¤
$dynamic_rnn/rnn/Assert/Assert/data_0Const*
dtype0*P
valueGBE B?Expected shape for Tensor dynamic_rnn/rnn/sequence_length:0 is *
_output_shapes
: 
u
$dynamic_rnn/rnn/Assert/Assert/data_2Const*
dtype0*!
valueB B but saw shape: *
_output_shapes
: 
Ų
dynamic_rnn/rnn/Assert/AssertAssertdynamic_rnn/rnn/All$dynamic_rnn/rnn/Assert/Assert/data_0dynamic_rnn/rnn/stack$dynamic_rnn/rnn/Assert/Assert/data_2dynamic_rnn/rnn/Shape_1*
T
2*
	summarize

dynamic_rnn/rnn/CheckSeqLenIdentitydynamic_rnn/rnn/sequence_length^dynamic_rnn/rnn/Assert/Assert*
T0*#
_output_shapes
:’’’’’’’’’
p
dynamic_rnn/rnn/Shape_2Shapedynamic_rnn/rnn/transpose*
_output_shapes
:*
out_type0*
T0
o
%dynamic_rnn/rnn/strided_slice_1/stackConst*
_output_shapes
:*
valueB: *
dtype0
q
'dynamic_rnn/rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
q
'dynamic_rnn/rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ó
dynamic_rnn/rnn/strided_slice_1StridedSlicedynamic_rnn/rnn/Shape_2%dynamic_rnn/rnn/strided_slice_1/stack'dynamic_rnn/rnn/strided_slice_1/stack_1'dynamic_rnn/rnn/strided_slice_1/stack_2*
new_axis_mask *
ellipsis_mask *
_output_shapes
: *
Index0*
end_mask *
T0*
shrink_axis_mask*

begin_mask 
p
dynamic_rnn/rnn/Shape_3Shapedynamic_rnn/rnn/transpose*
T0*
_output_shapes
:*
out_type0
o
%dynamic_rnn/rnn/strided_slice_2/stackConst*
_output_shapes
:*
valueB:*
dtype0
q
'dynamic_rnn/rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
q
'dynamic_rnn/rnn/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ó
dynamic_rnn/rnn/strided_slice_2StridedSlicedynamic_rnn/rnn/Shape_3%dynamic_rnn/rnn/strided_slice_2/stack'dynamic_rnn/rnn/strided_slice_2/stack_1'dynamic_rnn/rnn/strided_slice_2/stack_2*
end_mask *
_output_shapes
: *
shrink_axis_mask*
T0*

begin_mask *
Index0*
new_axis_mask *
ellipsis_mask 
`
dynamic_rnn/rnn/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B : 

dynamic_rnn/rnn/ExpandDims
ExpandDimsdynamic_rnn/rnn/strided_slice_2dynamic_rnn/rnn/ExpandDims/dim*
_output_shapes
:*

Tdim0*
T0
a
dynamic_rnn/rnn/Const_1Const*
_output_shapes
:*
dtype0*
valueB:@
_
dynamic_rnn/rnn/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
²
dynamic_rnn/rnn/concat_1ConcatV2dynamic_rnn/rnn/ExpandDimsdynamic_rnn/rnn/Const_1dynamic_rnn/rnn/concat_1/axis*
N*

Tidx0*
_output_shapes
:*
T0
`
dynamic_rnn/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

dynamic_rnn/rnn/zerosFilldynamic_rnn/rnn/concat_1dynamic_rnn/rnn/zeros/Const*'
_output_shapes
:’’’’’’’’’@*

index_type0*
T0
a
dynamic_rnn/rnn/Const_2Const*
_output_shapes
:*
valueB: *
dtype0

dynamic_rnn/rnn/MinMindynamic_rnn/rnn/CheckSeqLendynamic_rnn/rnn/Const_2*

Tidx0*
	keep_dims( *
_output_shapes
: *
T0
a
dynamic_rnn/rnn/Const_3Const*
_output_shapes
:*
valueB: *
dtype0

dynamic_rnn/rnn/MaxMaxdynamic_rnn/rnn/CheckSeqLendynamic_rnn/rnn/Const_3*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
V
dynamic_rnn/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
§
dynamic_rnn/rnn/TensorArrayTensorArrayV3dynamic_rnn/rnn/strided_slice_1*
dtype0*
identical_element_shapes(*$
element_shape:’’’’’’’’’@*
clear_after_read(*;
tensor_array_name&$dynamic_rnn/rnn/dynamic_rnn/output_0*
_output_shapes

:: *
dynamic_size( 
©
dynamic_rnn/rnn/TensorArray_1TensorArrayV3dynamic_rnn/rnn/strided_slice_1*
identical_element_shapes(*
clear_after_read(*%
element_shape:’’’’’’’’’Č*:
tensor_array_name%#dynamic_rnn/rnn/dynamic_rnn/input_0*
_output_shapes

:: *
dtype0*
dynamic_size( 

(dynamic_rnn/rnn/TensorArrayUnstack/ShapeShapedynamic_rnn/rnn/transpose*
out_type0*
T0*
_output_shapes
:

6dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
_output_shapes
:*
dtype0

8dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

8dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
Ø
0dynamic_rnn/rnn/TensorArrayUnstack/strided_sliceStridedSlice(dynamic_rnn/rnn/TensorArrayUnstack/Shape6dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stack8dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stack_18dynamic_rnn/rnn/TensorArrayUnstack/strided_slice/stack_2*
T0*
shrink_axis_mask*
end_mask *
new_axis_mask *
_output_shapes
: *

begin_mask *
ellipsis_mask *
Index0
p
.dynamic_rnn/rnn/TensorArrayUnstack/range/startConst*
_output_shapes
: *
dtype0*
value	B : 
p
.dynamic_rnn/rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :
ō
(dynamic_rnn/rnn/TensorArrayUnstack/rangeRange.dynamic_rnn/rnn/TensorArrayUnstack/range/start0dynamic_rnn/rnn/TensorArrayUnstack/strided_slice.dynamic_rnn/rnn/TensorArrayUnstack/range/delta*

Tidx0*#
_output_shapes
:’’’’’’’’’
¶
Jdynamic_rnn/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3dynamic_rnn/rnn/TensorArray_1(dynamic_rnn/rnn/TensorArrayUnstack/rangedynamic_rnn/rnn/transposedynamic_rnn/rnn/TensorArray_1:1*,
_class"
 loc:@dynamic_rnn/rnn/transpose*
_output_shapes
: *
T0
[
dynamic_rnn/rnn/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B :
s
dynamic_rnn/rnn/MaximumMaximumdynamic_rnn/rnn/Maximum/xdynamic_rnn/rnn/Max*
_output_shapes
: *
T0
}
dynamic_rnn/rnn/MinimumMinimumdynamic_rnn/rnn/strided_slice_1dynamic_rnn/rnn/Maximum*
T0*
_output_shapes
: 
i
'dynamic_rnn/rnn/while/iteration_counterConst*
_output_shapes
: *
value	B : *
dtype0
Ń
dynamic_rnn/rnn/while/EnterEnter'dynamic_rnn/rnn/while/iteration_counter*3

frame_name%#dynamic_rnn/rnn/while/while_context*
parallel_iterations *
T0*
is_constant( *
_output_shapes
: 
Ą
dynamic_rnn/rnn/while/Enter_1Enterdynamic_rnn/rnn/time*
_output_shapes
: *
T0*3

frame_name%#dynamic_rnn/rnn/while/while_context*
parallel_iterations *
is_constant( 
É
dynamic_rnn/rnn/while/Enter_2Enterdynamic_rnn/rnn/TensorArray:1*
T0*
parallel_iterations *3

frame_name%#dynamic_rnn/rnn/while/while_context*
_output_shapes
: *
is_constant( 

dynamic_rnn/rnn/while/Enter_3EnterLDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros*
T0*3

frame_name%#dynamic_rnn/rnn/while/while_context*
parallel_iterations *
is_constant( *'
_output_shapes
:’’’’’’’’’@

dynamic_rnn/rnn/while/Enter_4EnterNDropoutWrapperZeroState/DropoutWrapperZeroState/BasicLSTMCellZeroState/zeros_1*3

frame_name%#dynamic_rnn/rnn/while/while_context*
T0*
is_constant( *'
_output_shapes
:’’’’’’’’’@*
parallel_iterations 

dynamic_rnn/rnn/while/MergeMergedynamic_rnn/rnn/while/Enter#dynamic_rnn/rnn/while/NextIteration*
_output_shapes
: : *
N*
T0

dynamic_rnn/rnn/while/Merge_1Mergedynamic_rnn/rnn/while/Enter_1%dynamic_rnn/rnn/while/NextIteration_1*
_output_shapes
: : *
N*
T0

dynamic_rnn/rnn/while/Merge_2Mergedynamic_rnn/rnn/while/Enter_2%dynamic_rnn/rnn/while/NextIteration_2*
N*
T0*
_output_shapes
: : 
©
dynamic_rnn/rnn/while/Merge_3Mergedynamic_rnn/rnn/while/Enter_3%dynamic_rnn/rnn/while/NextIteration_3*)
_output_shapes
:’’’’’’’’’@: *
N*
T0
©
dynamic_rnn/rnn/while/Merge_4Mergedynamic_rnn/rnn/while/Enter_4%dynamic_rnn/rnn/while/NextIteration_4*)
_output_shapes
:’’’’’’’’’@: *
T0*
N

dynamic_rnn/rnn/while/LessLessdynamic_rnn/rnn/while/Merge dynamic_rnn/rnn/while/Less/Enter*
_output_shapes
: *
T0
Ī
 dynamic_rnn/rnn/while/Less/EnterEnterdynamic_rnn/rnn/strided_slice_1*3

frame_name%#dynamic_rnn/rnn/while/while_context*
is_constant(*
T0*
_output_shapes
: *
parallel_iterations 

dynamic_rnn/rnn/while/Less_1Lessdynamic_rnn/rnn/while/Merge_1"dynamic_rnn/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
Č
"dynamic_rnn/rnn/while/Less_1/EnterEnterdynamic_rnn/rnn/Minimum*
is_constant(*
_output_shapes
: *
parallel_iterations *3

frame_name%#dynamic_rnn/rnn/while/while_context*
T0

 dynamic_rnn/rnn/while/LogicalAnd
LogicalAnddynamic_rnn/rnn/while/Lessdynamic_rnn/rnn/while/Less_1*
_output_shapes
: 
d
dynamic_rnn/rnn/while/LoopCondLoopCond dynamic_rnn/rnn/while/LogicalAnd*
_output_shapes
: 
¶
dynamic_rnn/rnn/while/SwitchSwitchdynamic_rnn/rnn/while/Mergedynamic_rnn/rnn/while/LoopCond*
T0*
_output_shapes
: : *.
_class$
" loc:@dynamic_rnn/rnn/while/Merge
¼
dynamic_rnn/rnn/while/Switch_1Switchdynamic_rnn/rnn/while/Merge_1dynamic_rnn/rnn/while/LoopCond*0
_class&
$"loc:@dynamic_rnn/rnn/while/Merge_1*
T0*
_output_shapes
: : 
¼
dynamic_rnn/rnn/while/Switch_2Switchdynamic_rnn/rnn/while/Merge_2dynamic_rnn/rnn/while/LoopCond*
_output_shapes
: : *
T0*0
_class&
$"loc:@dynamic_rnn/rnn/while/Merge_2
Ž
dynamic_rnn/rnn/while/Switch_3Switchdynamic_rnn/rnn/while/Merge_3dynamic_rnn/rnn/while/LoopCond*
T0*0
_class&
$"loc:@dynamic_rnn/rnn/while/Merge_3*:
_output_shapes(
&:’’’’’’’’’@:’’’’’’’’’@
Ž
dynamic_rnn/rnn/while/Switch_4Switchdynamic_rnn/rnn/while/Merge_4dynamic_rnn/rnn/while/LoopCond*0
_class&
$"loc:@dynamic_rnn/rnn/while/Merge_4*:
_output_shapes(
&:’’’’’’’’’@:’’’’’’’’’@*
T0
k
dynamic_rnn/rnn/while/IdentityIdentitydynamic_rnn/rnn/while/Switch:1*
T0*
_output_shapes
: 
o
 dynamic_rnn/rnn/while/Identity_1Identity dynamic_rnn/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
o
 dynamic_rnn/rnn/while/Identity_2Identity dynamic_rnn/rnn/while/Switch_2:1*
T0*
_output_shapes
: 

 dynamic_rnn/rnn/while/Identity_3Identity dynamic_rnn/rnn/while/Switch_3:1*'
_output_shapes
:’’’’’’’’’@*
T0

 dynamic_rnn/rnn/while/Identity_4Identity dynamic_rnn/rnn/while/Switch_4:1*'
_output_shapes
:’’’’’’’’’@*
T0
~
dynamic_rnn/rnn/while/add/yConst^dynamic_rnn/rnn/while/Identity*
_output_shapes
: *
dtype0*
value	B :
~
dynamic_rnn/rnn/while/addAdddynamic_rnn/rnn/while/Identitydynamic_rnn/rnn/while/add/y*
T0*
_output_shapes
: 
õ
'dynamic_rnn/rnn/while/TensorArrayReadV3TensorArrayReadV3-dynamic_rnn/rnn/while/TensorArrayReadV3/Enter dynamic_rnn/rnn/while/Identity_1/dynamic_rnn/rnn/while/TensorArrayReadV3/Enter_1*(
_output_shapes
:’’’’’’’’’Č*
dtype0
Ż
-dynamic_rnn/rnn/while/TensorArrayReadV3/EnterEnterdynamic_rnn/rnn/TensorArray_1*
T0*
is_constant(*
_output_shapes
:*
parallel_iterations *3

frame_name%#dynamic_rnn/rnn/while/while_context

/dynamic_rnn/rnn/while/TensorArrayReadV3/Enter_1EnterJdynamic_rnn/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
is_constant(*
parallel_iterations *
T0*3

frame_name%#dynamic_rnn/rnn/while/while_context*
_output_shapes
: 
¬
"dynamic_rnn/rnn/while/GreaterEqualGreaterEqual dynamic_rnn/rnn/while/Identity_1(dynamic_rnn/rnn/while/GreaterEqual/Enter*#
_output_shapes
:’’’’’’’’’*
T0
ß
(dynamic_rnn/rnn/while/GreaterEqual/EnterEnterdynamic_rnn/rnn/CheckSeqLen*
parallel_iterations *
T0*3

frame_name%#dynamic_rnn/rnn/while/while_context*#
_output_shapes
:’’’’’’’’’*
is_constant(
Ó
Gdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
valueB"     *
dtype0*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel
Å
Edynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*
dtype0*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
_output_shapes
: *
valueB
 *ĶĢĢ½
Å
Edynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
_output_shapes
: *
dtype0*
valueB
 *ĶĢĢ=
µ
Odynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformGdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
*
dtype0*
T0*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
seed2 *

seed 
¶
Edynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubEdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxEdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
: *9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
T0
Ź
Edynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMulOdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformEdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
T0
¼
Adynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddEdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulEdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel* 
_output_shapes
:

Ł
&dynamic_rnn/rnn/basic_lstm_cell/kernel
VariableV2*
	container *
shared_name * 
_output_shapes
:
*
dtype0*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
shape:

±
-dynamic_rnn/rnn/basic_lstm_cell/kernel/AssignAssign&dynamic_rnn/rnn/basic_lstm_cell/kernelAdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform* 
_output_shapes
:
*
T0*
use_locking(*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel*
validate_shape(

+dynamic_rnn/rnn/basic_lstm_cell/kernel/readIdentity&dynamic_rnn/rnn/basic_lstm_cell/kernel*
T0* 
_output_shapes
:

¾
6dynamic_rnn/rnn/basic_lstm_cell/bias/Initializer/zerosConst*
dtype0*
valueB*    *
_output_shapes	
:*7
_class-
+)loc:@dynamic_rnn/rnn/basic_lstm_cell/bias
Ė
$dynamic_rnn/rnn/basic_lstm_cell/bias
VariableV2*
shape:*
dtype0*7
_class-
+)loc:@dynamic_rnn/rnn/basic_lstm_cell/bias*
	container *
shared_name *
_output_shapes	
:

+dynamic_rnn/rnn/basic_lstm_cell/bias/AssignAssign$dynamic_rnn/rnn/basic_lstm_cell/bias6dynamic_rnn/rnn/basic_lstm_cell/bias/Initializer/zeros*
validate_shape(*
T0*7
_class-
+)loc:@dynamic_rnn/rnn/basic_lstm_cell/bias*
_output_shapes	
:*
use_locking(

)dynamic_rnn/rnn/basic_lstm_cell/bias/readIdentity$dynamic_rnn/rnn/basic_lstm_cell/bias*
T0*
_output_shapes	
:

+dynamic_rnn/rnn/while/basic_lstm_cell/ConstConst^dynamic_rnn/rnn/while/Identity*
dtype0*
value	B :*
_output_shapes
: 

1dynamic_rnn/rnn/while/basic_lstm_cell/concat/axisConst^dynamic_rnn/rnn/while/Identity*
dtype0*
value	B :*
_output_shapes
: 
ž
,dynamic_rnn/rnn/while/basic_lstm_cell/concatConcatV2'dynamic_rnn/rnn/while/TensorArrayReadV3 dynamic_rnn/rnn/while/Identity_41dynamic_rnn/rnn/while/basic_lstm_cell/concat/axis*

Tidx0*
N*(
_output_shapes
:’’’’’’’’’*
T0
ń
,dynamic_rnn/rnn/while/basic_lstm_cell/MatMulMatMul,dynamic_rnn/rnn/while/basic_lstm_cell/concat2dynamic_rnn/rnn/while/basic_lstm_cell/MatMul/Enter*(
_output_shapes
:’’’’’’’’’*
T0*
transpose_a( *
transpose_b( 
ö
2dynamic_rnn/rnn/while/basic_lstm_cell/MatMul/EnterEnter+dynamic_rnn/rnn/basic_lstm_cell/kernel/read*
parallel_iterations *
is_constant(*
T0*3

frame_name%#dynamic_rnn/rnn/while/while_context* 
_output_shapes
:

å
-dynamic_rnn/rnn/while/basic_lstm_cell/BiasAddBiasAdd,dynamic_rnn/rnn/while/basic_lstm_cell/MatMul3dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:’’’’’’’’’
š
3dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd/EnterEnter)dynamic_rnn/rnn/basic_lstm_cell/bias/read*3

frame_name%#dynamic_rnn/rnn/while/while_context*
T0*
parallel_iterations *
_output_shapes	
:*
is_constant(

-dynamic_rnn/rnn/while/basic_lstm_cell/Const_1Const^dynamic_rnn/rnn/while/Identity*
dtype0*
value	B :*
_output_shapes
: 

+dynamic_rnn/rnn/while/basic_lstm_cell/splitSplit+dynamic_rnn/rnn/while/basic_lstm_cell/Const-dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*`
_output_shapesN
L:’’’’’’’’’@:’’’’’’’’’@:’’’’’’’’’@:’’’’’’’’’@

-dynamic_rnn/rnn/while/basic_lstm_cell/Const_2Const^dynamic_rnn/rnn/while/Identity*
valueB
 *  ?*
dtype0*
_output_shapes
: 
Ą
)dynamic_rnn/rnn/while/basic_lstm_cell/AddAdd-dynamic_rnn/rnn/while/basic_lstm_cell/split:2-dynamic_rnn/rnn/while/basic_lstm_cell/Const_2*'
_output_shapes
:’’’’’’’’’@*
T0

-dynamic_rnn/rnn/while/basic_lstm_cell/SigmoidSigmoid)dynamic_rnn/rnn/while/basic_lstm_cell/Add*'
_output_shapes
:’’’’’’’’’@*
T0
³
)dynamic_rnn/rnn/while/basic_lstm_cell/MulMul dynamic_rnn/rnn/while/Identity_3-dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid*'
_output_shapes
:’’’’’’’’’@*
T0

/dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid+dynamic_rnn/rnn/while/basic_lstm_cell/split*'
_output_shapes
:’’’’’’’’’@*
T0

*dynamic_rnn/rnn/while/basic_lstm_cell/TanhTanh-dynamic_rnn/rnn/while/basic_lstm_cell/split:1*'
_output_shapes
:’’’’’’’’’@*
T0
Į
+dynamic_rnn/rnn/while/basic_lstm_cell/Mul_1Mul/dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_1*dynamic_rnn/rnn/while/basic_lstm_cell/Tanh*
T0*'
_output_shapes
:’’’’’’’’’@
¼
+dynamic_rnn/rnn/while/basic_lstm_cell/Add_1Add)dynamic_rnn/rnn/while/basic_lstm_cell/Mul+dynamic_rnn/rnn/while/basic_lstm_cell/Mul_1*'
_output_shapes
:’’’’’’’’’@*
T0

,dynamic_rnn/rnn/while/basic_lstm_cell/Tanh_1Tanh+dynamic_rnn/rnn/while/basic_lstm_cell/Add_1*
T0*'
_output_shapes
:’’’’’’’’’@

/dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid-dynamic_rnn/rnn/while/basic_lstm_cell/split:3*
T0*'
_output_shapes
:’’’’’’’’’@
Ć
+dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2Mul,dynamic_rnn/rnn/while/basic_lstm_cell/Tanh_1/dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_2*'
_output_shapes
:’’’’’’’’’@*
T0

dynamic_rnn/rnn/while/SelectSelect"dynamic_rnn/rnn/while/GreaterEqual"dynamic_rnn/rnn/while/Select/Enter+dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2*'
_output_shapes
:’’’’’’’’’@*
T0*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2

"dynamic_rnn/rnn/while/Select/EnterEnterdynamic_rnn/rnn/zeros*'
_output_shapes
:’’’’’’’’’@*
is_constant(*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2*3

frame_name%#dynamic_rnn/rnn/while/while_context*
T0*
parallel_iterations 

dynamic_rnn/rnn/while/Select_1Select"dynamic_rnn/rnn/while/GreaterEqual dynamic_rnn/rnn/while/Identity_3+dynamic_rnn/rnn/while/basic_lstm_cell/Add_1*'
_output_shapes
:’’’’’’’’’@*
T0*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Add_1

dynamic_rnn/rnn/while/Select_2Select"dynamic_rnn/rnn/while/GreaterEqual dynamic_rnn/rnn/while/Identity_4+dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2*'
_output_shapes
:’’’’’’’’’@*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2*
T0
Ó
9dynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3?dynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter dynamic_rnn/rnn/while/Identity_1dynamic_rnn/rnn/while/Select dynamic_rnn/rnn/while/Identity_2*
_output_shapes
: *
T0*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2
­
?dynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterdynamic_rnn/rnn/TensorArray*
parallel_iterations *
_output_shapes
:*
is_constant(*3

frame_name%#dynamic_rnn/rnn/while/while_context*
T0*>
_class4
20loc:@dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2

dynamic_rnn/rnn/while/add_1/yConst^dynamic_rnn/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0

dynamic_rnn/rnn/while/add_1Add dynamic_rnn/rnn/while/Identity_1dynamic_rnn/rnn/while/add_1/y*
_output_shapes
: *
T0
p
#dynamic_rnn/rnn/while/NextIterationNextIterationdynamic_rnn/rnn/while/add*
T0*
_output_shapes
: 
t
%dynamic_rnn/rnn/while/NextIteration_1NextIterationdynamic_rnn/rnn/while/add_1*
T0*
_output_shapes
: 

%dynamic_rnn/rnn/while/NextIteration_2NextIteration9dynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
_output_shapes
: *
T0

%dynamic_rnn/rnn/while/NextIteration_3NextIterationdynamic_rnn/rnn/while/Select_1*'
_output_shapes
:’’’’’’’’’@*
T0

%dynamic_rnn/rnn/while/NextIteration_4NextIterationdynamic_rnn/rnn/while/Select_2*
T0*'
_output_shapes
:’’’’’’’’’@
a
dynamic_rnn/rnn/while/ExitExitdynamic_rnn/rnn/while/Switch*
_output_shapes
: *
T0
e
dynamic_rnn/rnn/while/Exit_1Exitdynamic_rnn/rnn/while/Switch_1*
_output_shapes
: *
T0
e
dynamic_rnn/rnn/while/Exit_2Exitdynamic_rnn/rnn/while/Switch_2*
T0*
_output_shapes
: 
v
dynamic_rnn/rnn/while/Exit_3Exitdynamic_rnn/rnn/while/Switch_3*'
_output_shapes
:’’’’’’’’’@*
T0
v
dynamic_rnn/rnn/while/Exit_4Exitdynamic_rnn/rnn/while/Switch_4*'
_output_shapes
:’’’’’’’’’@*
T0
Ź
2dynamic_rnn/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3dynamic_rnn/rnn/TensorArraydynamic_rnn/rnn/while/Exit_2*.
_class$
" loc:@dynamic_rnn/rnn/TensorArray*
_output_shapes
: 

,dynamic_rnn/rnn/TensorArrayStack/range/startConst*
_output_shapes
: *
dtype0*.
_class$
" loc:@dynamic_rnn/rnn/TensorArray*
value	B : 

,dynamic_rnn/rnn/TensorArrayStack/range/deltaConst*
_output_shapes
: *.
_class$
" loc:@dynamic_rnn/rnn/TensorArray*
value	B :*
dtype0
 
&dynamic_rnn/rnn/TensorArrayStack/rangeRange,dynamic_rnn/rnn/TensorArrayStack/range/start2dynamic_rnn/rnn/TensorArrayStack/TensorArraySizeV3,dynamic_rnn/rnn/TensorArrayStack/range/delta*#
_output_shapes
:’’’’’’’’’*.
_class$
" loc:@dynamic_rnn/rnn/TensorArray*

Tidx0
Ē
4dynamic_rnn/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3dynamic_rnn/rnn/TensorArray&dynamic_rnn/rnn/TensorArrayStack/rangedynamic_rnn/rnn/while/Exit_2*4
_output_shapes"
 :’’’’’’’’’’’’’’’’’’@*$
element_shape:’’’’’’’’’@*.
_class$
" loc:@dynamic_rnn/rnn/TensorArray*
dtype0
a
dynamic_rnn/rnn/Const_4Const*
dtype0*
valueB:@*
_output_shapes
:
X
dynamic_rnn/rnn/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
_
dynamic_rnn/rnn/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
_
dynamic_rnn/rnn/range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

dynamic_rnn/rnn/range_1Rangedynamic_rnn/rnn/range_1/startdynamic_rnn/rnn/Rank_1dynamic_rnn/rnn/range_1/delta*

Tidx0*
_output_shapes
:
r
!dynamic_rnn/rnn/concat_2/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
_
dynamic_rnn/rnn/concat_2/axisConst*
_output_shapes
: *
value	B : *
dtype0
¹
dynamic_rnn/rnn/concat_2ConcatV2!dynamic_rnn/rnn/concat_2/values_0dynamic_rnn/rnn/range_1dynamic_rnn/rnn/concat_2/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ä
dynamic_rnn/rnn/transpose_1	Transpose4dynamic_rnn/rnn/TensorArrayStack/TensorArrayGatherV3dynamic_rnn/rnn/concat_2*
Tperm0*
T0*4
_output_shapes"
 :’’’’’’’’’’’’’’’’’’@
l
dynamic_rnn/ShapeShapedynamic_rnn/rnn/transpose_1*
T0*
out_type0*
_output_shapes
:
i
dynamic_rnn/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
k
!dynamic_rnn/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
k
!dynamic_rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
µ
dynamic_rnn/strided_sliceStridedSlicedynamic_rnn/Shapedynamic_rnn/strided_slice/stack!dynamic_rnn/strided_slice/stack_1!dynamic_rnn/strided_slice/stack_2*
end_mask *
ellipsis_mask *
shrink_axis_mask*
T0*
new_axis_mask *
Index0*

begin_mask *
_output_shapes
: 
n
dynamic_rnn/Shape_1Shapedynamic_rnn/rnn/transpose_1*
out_type0*
_output_shapes
:*
T0
k
!dynamic_rnn/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
m
#dynamic_rnn/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
m
#dynamic_rnn/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
æ
dynamic_rnn/strided_slice_1StridedSlicedynamic_rnn/Shape_1!dynamic_rnn/strided_slice_1/stack#dynamic_rnn/strided_slice_1/stack_1#dynamic_rnn/strided_slice_1/stack_2*

begin_mask *
ellipsis_mask *
Index0*
T0*
shrink_axis_mask*
new_axis_mask *
end_mask *
_output_shapes
: 
Y
dynamic_rnn/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
Y
dynamic_rnn/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :

dynamic_rnn/rangeRangedynamic_rnn/range/startdynamic_rnn/strided_slicedynamic_rnn/range/delta*#
_output_shapes
:’’’’’’’’’*

Tidx0
t
dynamic_rnn/mulMuldynamic_rnn/rangedynamic_rnn/strided_slice_1*#
_output_shapes
:’’’’’’’’’*
T0
S
dynamic_rnn/sub/yConst*
_output_shapes
: *
value	B :*
dtype0
g
dynamic_rnn/subSubGetLength/Castdynamic_rnn/sub/y*
T0*#
_output_shapes
:’’’’’’’’’
f
dynamic_rnn/addAdddynamic_rnn/muldynamic_rnn/sub*#
_output_shapes
:’’’’’’’’’*
T0
j
dynamic_rnn/Reshape/shapeConst*
_output_shapes
:*
valueB"’’’’@   *
dtype0

dynamic_rnn/ReshapeReshapedynamic_rnn/rnn/transpose_1dynamic_rnn/Reshape/shape*
Tshape0*'
_output_shapes
:’’’’’’’’’@*
T0
[
dynamic_rnn/GatherV2/axisConst*
_output_shapes
: *
value	B : *
dtype0
¶
dynamic_rnn/GatherV2GatherV2dynamic_rnn/Reshapedynamic_rnn/adddynamic_rnn/GatherV2/axis*
Tindices0*
Taxis0*'
_output_shapes
:’’’’’’’’’@*
Tparams0

+output/W/Initializer/truncated_normal/shapeConst*
_output_shapes
:*
valueB"@      *
dtype0*
_class
loc:@output/W

*output/W/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*
_class
loc:@output/W*
_output_shapes
: 

,output/W/Initializer/truncated_normal/stddevConst*
_output_shapes
: *
valueB
 *ĶĢĢ=*
_class
loc:@output/W*
dtype0
į
5output/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormal+output/W/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:@*
T0*
_class
loc:@output/W*
seed2 *

seed 
Ū
)output/W/Initializer/truncated_normal/mulMul5output/W/Initializer/truncated_normal/TruncatedNormal,output/W/Initializer/truncated_normal/stddev*
T0*
_class
loc:@output/W*
_output_shapes

:@
É
%output/W/Initializer/truncated_normalAdd)output/W/Initializer/truncated_normal/mul*output/W/Initializer/truncated_normal/mean*
_output_shapes

:@*
T0*
_class
loc:@output/W

output/W
VariableV2*
	container *
shared_name *
shape
:@*
_output_shapes

:@*
_class
loc:@output/W*
dtype0
¹
output/W/AssignAssignoutput/W%output/W/Initializer/truncated_normal*
_class
loc:@output/W*
T0*
use_locking(*
validate_shape(*
_output_shapes

:@
i
output/W/readIdentityoutput/W*
_class
loc:@output/W*
T0*
_output_shapes

:@

output/b/Initializer/ConstConst*
_output_shapes
:*
valueB*    *
_class
loc:@output/b*
dtype0

output/b
VariableV2*
	container *
_class
loc:@output/b*
_output_shapes
:*
dtype0*
shape:*
shared_name 
Ŗ
output/b/AssignAssignoutput/boutput/b/Initializer/Const*
_output_shapes
:*
validate_shape(*
T0*
_class
loc:@output/b*
use_locking(
e
output/b/readIdentityoutput/b*
_output_shapes
:*
_class
loc:@output/b*
T0

output/MatMulMatMuldynamic_rnn/GatherV2output/W/read*
transpose_b( *
transpose_a( *'
_output_shapes
:’’’’’’’’’*
T0
a

output/addAddoutput/MatMuloutput/b/read*'
_output_shapes
:’’’’’’’’’*
T0
Y
output/IdentityIdentity
output/add*
T0*'
_output_shapes
:’’’’’’’’’
U
SoftmaxSoftmaxoutput/Identity*
T0*'
_output_shapes
:’’’’’’’’’
R
ArgMax/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
x
ArgMaxArgMaxSoftmaxArgMax/dimension*
output_type0	*

Tidx0*
T0*#
_output_shapes
:’’’’’’’’’

initNoOp,^dynamic_rnn/rnn/basic_lstm_cell/bias/Assign.^dynamic_rnn/rnn/basic_lstm_cell/kernel/Assign^output/W/Assign^output/b/Assign
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
Į
save/SaveV2/tensor_namesConst*
_output_shapes
:*u
valuelBjB$dynamic_rnn/rnn/basic_lstm_cell/biasB&dynamic_rnn/rnn/basic_lstm_cell/kernelBoutput/WBoutput/b*
dtype0
k
save/SaveV2/shape_and_slicesConst*
_output_shapes
:*
valueBB B B B *
dtype0
Ļ
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dynamic_rnn/rnn/basic_lstm_cell/bias&dynamic_rnn/rnn/basic_lstm_cell/kerneloutput/Woutput/b*
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_class
loc:@save/Const*
_output_shapes
: *
T0
Ó
save/RestoreV2/tensor_namesConst"/device:CPU:0*u
valuelBjB$dynamic_rnn/rnn/basic_lstm_cell/biasB&dynamic_rnn/rnn/basic_lstm_cell/kernelBoutput/WBoutput/b*
_output_shapes
:*
dtype0
}
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
valueBB B B B *
dtype0
®
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*$
_output_shapes
::::
Ó
save/AssignAssign$dynamic_rnn/rnn/basic_lstm_cell/biassave/RestoreV2*
use_locking(*
validate_shape(*
_output_shapes	
:*7
_class-
+)loc:@dynamic_rnn/rnn/basic_lstm_cell/bias*
T0
ą
save/Assign_1Assign&dynamic_rnn/rnn/basic_lstm_cell/kernelsave/RestoreV2:1*
use_locking(*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
*
validate_shape(*
T0
¢
save/Assign_2Assignoutput/Wsave/RestoreV2:2*
validate_shape(*
use_locking(*
_class
loc:@output/W*
T0*
_output_shapes

:@

save/Assign_3Assignoutput/bsave/RestoreV2:3*
_output_shapes
:*
use_locking(*
_class
loc:@output/b*
T0*
validate_shape(
V
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3
R
save_1/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel

save_1/StringJoin/inputs_1Const*
_output_shapes
: *<
value3B1 B+_temp_84c4750e15bf4c94892682daa8729894/part*
dtype0
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
S
save_1/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
Ņ
save_1/SaveV2/tensor_namesConst"/device:CPU:0*u
valuelBjB$dynamic_rnn/rnn/basic_lstm_cell/biasB&dynamic_rnn/rnn/basic_lstm_cell/kernelBoutput/WBoutput/b*
_output_shapes
:*
dtype0
|
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B B B 
š
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices$dynamic_rnn/rnn/basic_lstm_cell/bias&dynamic_rnn/rnn/basic_lstm_cell/kerneloutput/Woutput/b"/device:CPU:0*
dtypes
2
Ø
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
²
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*

axis *
N*
T0*
_output_shapes
:

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
Õ
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*u
valuelBjB$dynamic_rnn/rnn/basic_lstm_cell/biasB&dynamic_rnn/rnn/basic_lstm_cell/kernelBoutput/WBoutput/b*
dtype0

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B B B 
¶
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*$
_output_shapes
::::
×
save_1/AssignAssign$dynamic_rnn/rnn/basic_lstm_cell/biassave_1/RestoreV2*
use_locking(*7
_class-
+)loc:@dynamic_rnn/rnn/basic_lstm_cell/bias*
T0*
validate_shape(*
_output_shapes	
:
ä
save_1/Assign_1Assign&dynamic_rnn/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:1*
validate_shape(*9
_class/
-+loc:@dynamic_rnn/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
*
T0*
use_locking(
¦
save_1/Assign_2Assignoutput/Wsave_1/RestoreV2:2*
_class
loc:@output/W*
T0*
_output_shapes

:@*
validate_shape(*
use_locking(
¢
save_1/Assign_3Assignoutput/bsave_1/RestoreV2:3*
validate_shape(*
T0*
_class
loc:@output/b*
_output_shapes
:*
use_locking(
b
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"Ł
trainable_variablesĮ¾
Ļ
(dynamic_rnn/rnn/basic_lstm_cell/kernel:0-dynamic_rnn/rnn/basic_lstm_cell/kernel/Assign-dynamic_rnn/rnn/basic_lstm_cell/kernel/read:02Cdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:08
¾
&dynamic_rnn/rnn/basic_lstm_cell/bias:0+dynamic_rnn/rnn/basic_lstm_cell/bias/Assign+dynamic_rnn/rnn/basic_lstm_cell/bias/read:028dynamic_rnn/rnn/basic_lstm_cell/bias/Initializer/zeros:08
Y

output/W:0output/W/Assignoutput/W/read:02'output/W/Initializer/truncated_normal:08
N

output/b:0output/b/Assignoutput/b/read:02output/b/Initializer/Const:08"ó&
while_contextį&Ž&
Ū&
#dynamic_rnn/rnn/while/while_context * dynamic_rnn/rnn/while/LoopCond:02dynamic_rnn/rnn/while/Merge:0: dynamic_rnn/rnn/while/Identity:0Bdynamic_rnn/rnn/while/Exit:0Bdynamic_rnn/rnn/while/Exit_1:0Bdynamic_rnn/rnn/while/Exit_2:0Bdynamic_rnn/rnn/while/Exit_3:0Bdynamic_rnn/rnn/while/Exit_4:0Jč"
dynamic_rnn/rnn/CheckSeqLen:0
dynamic_rnn/rnn/Minimum:0
dynamic_rnn/rnn/TensorArray:0
Ldynamic_rnn/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
dynamic_rnn/rnn/TensorArray_1:0
+dynamic_rnn/rnn/basic_lstm_cell/bias/read:0
-dynamic_rnn/rnn/basic_lstm_cell/kernel/read:0
!dynamic_rnn/rnn/strided_slice_1:0
dynamic_rnn/rnn/while/Enter:0
dynamic_rnn/rnn/while/Enter_1:0
dynamic_rnn/rnn/while/Enter_2:0
dynamic_rnn/rnn/while/Enter_3:0
dynamic_rnn/rnn/while/Enter_4:0
dynamic_rnn/rnn/while/Exit:0
dynamic_rnn/rnn/while/Exit_1:0
dynamic_rnn/rnn/while/Exit_2:0
dynamic_rnn/rnn/while/Exit_3:0
dynamic_rnn/rnn/while/Exit_4:0
*dynamic_rnn/rnn/while/GreaterEqual/Enter:0
$dynamic_rnn/rnn/while/GreaterEqual:0
 dynamic_rnn/rnn/while/Identity:0
"dynamic_rnn/rnn/while/Identity_1:0
"dynamic_rnn/rnn/while/Identity_2:0
"dynamic_rnn/rnn/while/Identity_3:0
"dynamic_rnn/rnn/while/Identity_4:0
"dynamic_rnn/rnn/while/Less/Enter:0
dynamic_rnn/rnn/while/Less:0
$dynamic_rnn/rnn/while/Less_1/Enter:0
dynamic_rnn/rnn/while/Less_1:0
"dynamic_rnn/rnn/while/LogicalAnd:0
 dynamic_rnn/rnn/while/LoopCond:0
dynamic_rnn/rnn/while/Merge:0
dynamic_rnn/rnn/while/Merge:1
dynamic_rnn/rnn/while/Merge_1:0
dynamic_rnn/rnn/while/Merge_1:1
dynamic_rnn/rnn/while/Merge_2:0
dynamic_rnn/rnn/while/Merge_2:1
dynamic_rnn/rnn/while/Merge_3:0
dynamic_rnn/rnn/while/Merge_3:1
dynamic_rnn/rnn/while/Merge_4:0
dynamic_rnn/rnn/while/Merge_4:1
%dynamic_rnn/rnn/while/NextIteration:0
'dynamic_rnn/rnn/while/NextIteration_1:0
'dynamic_rnn/rnn/while/NextIteration_2:0
'dynamic_rnn/rnn/while/NextIteration_3:0
'dynamic_rnn/rnn/while/NextIteration_4:0
$dynamic_rnn/rnn/while/Select/Enter:0
dynamic_rnn/rnn/while/Select:0
 dynamic_rnn/rnn/while/Select_1:0
 dynamic_rnn/rnn/while/Select_2:0
dynamic_rnn/rnn/while/Switch:0
dynamic_rnn/rnn/while/Switch:1
 dynamic_rnn/rnn/while/Switch_1:0
 dynamic_rnn/rnn/while/Switch_1:1
 dynamic_rnn/rnn/while/Switch_2:0
 dynamic_rnn/rnn/while/Switch_2:1
 dynamic_rnn/rnn/while/Switch_3:0
 dynamic_rnn/rnn/while/Switch_3:1
 dynamic_rnn/rnn/while/Switch_4:0
 dynamic_rnn/rnn/while/Switch_4:1
/dynamic_rnn/rnn/while/TensorArrayReadV3/Enter:0
1dynamic_rnn/rnn/while/TensorArrayReadV3/Enter_1:0
)dynamic_rnn/rnn/while/TensorArrayReadV3:0
Adynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
;dynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
dynamic_rnn/rnn/while/add/y:0
dynamic_rnn/rnn/while/add:0
dynamic_rnn/rnn/while/add_1/y:0
dynamic_rnn/rnn/while/add_1:0
+dynamic_rnn/rnn/while/basic_lstm_cell/Add:0
-dynamic_rnn/rnn/while/basic_lstm_cell/Add_1:0
5dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
/dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd:0
-dynamic_rnn/rnn/while/basic_lstm_cell/Const:0
/dynamic_rnn/rnn/while/basic_lstm_cell/Const_1:0
/dynamic_rnn/rnn/while/basic_lstm_cell/Const_2:0
4dynamic_rnn/rnn/while/basic_lstm_cell/MatMul/Enter:0
.dynamic_rnn/rnn/while/basic_lstm_cell/MatMul:0
+dynamic_rnn/rnn/while/basic_lstm_cell/Mul:0
-dynamic_rnn/rnn/while/basic_lstm_cell/Mul_1:0
-dynamic_rnn/rnn/while/basic_lstm_cell/Mul_2:0
/dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid:0
1dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_1:0
1dynamic_rnn/rnn/while/basic_lstm_cell/Sigmoid_2:0
,dynamic_rnn/rnn/while/basic_lstm_cell/Tanh:0
.dynamic_rnn/rnn/while/basic_lstm_cell/Tanh_1:0
3dynamic_rnn/rnn/while/basic_lstm_cell/concat/axis:0
.dynamic_rnn/rnn/while/basic_lstm_cell/concat:0
-dynamic_rnn/rnn/while/basic_lstm_cell/split:0
-dynamic_rnn/rnn/while/basic_lstm_cell/split:1
-dynamic_rnn/rnn/while/basic_lstm_cell/split:2
-dynamic_rnn/rnn/while/basic_lstm_cell/split:3
dynamic_rnn/rnn/zeros:0?
dynamic_rnn/rnn/zeros:0$dynamic_rnn/rnn/while/Select/Enter:0
Ldynamic_rnn/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:01dynamic_rnn/rnn/while/TensorArrayReadV3/Enter_1:0e
-dynamic_rnn/rnn/basic_lstm_cell/kernel/read:04dynamic_rnn/rnn/while/basic_lstm_cell/MatMul/Enter:0K
dynamic_rnn/rnn/CheckSeqLen:0*dynamic_rnn/rnn/while/GreaterEqual/Enter:0A
dynamic_rnn/rnn/Minimum:0$dynamic_rnn/rnn/while/Less_1/Enter:0d
+dynamic_rnn/rnn/basic_lstm_cell/bias/read:05dynamic_rnn/rnn/while/basic_lstm_cell/BiasAdd/Enter:0G
!dynamic_rnn/rnn/strided_slice_1:0"dynamic_rnn/rnn/while/Less/Enter:0b
dynamic_rnn/rnn/TensorArray:0Adynamic_rnn/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0R
dynamic_rnn/rnn/TensorArray_1:0/dynamic_rnn/rnn/while/TensorArrayReadV3/Enter:0Rdynamic_rnn/rnn/while/Enter:0Rdynamic_rnn/rnn/while/Enter_1:0Rdynamic_rnn/rnn/while/Enter_2:0Rdynamic_rnn/rnn/while/Enter_3:0Rdynamic_rnn/rnn/while/Enter_4:0Z!dynamic_rnn/rnn/strided_slice_1:0"Ļ
	variablesĮ¾
Ļ
(dynamic_rnn/rnn/basic_lstm_cell/kernel:0-dynamic_rnn/rnn/basic_lstm_cell/kernel/Assign-dynamic_rnn/rnn/basic_lstm_cell/kernel/read:02Cdynamic_rnn/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:08
¾
&dynamic_rnn/rnn/basic_lstm_cell/bias:0+dynamic_rnn/rnn/basic_lstm_cell/bias/Assign+dynamic_rnn/rnn/basic_lstm_cell/bias/read:028dynamic_rnn/rnn/basic_lstm_cell/bias/Initializer/zeros:08
Y

output/W:0output/W/Assignoutput/W/read:02'output/W/Initializer/truncated_normal:08
N

output/b:0output/b/Assignoutput/b/read:02output/b/Initializer/Const:08*
serving_default
2
x-
inputs:0’’’’’’’’’’’’’’’’’’Č-
y(
output/Identity:0’’’’’’’’’tensorflow/serving/predict*
predict_text
2
x-
inputs:0’’’’’’’’’’’’’’’’’’Č-
y(
output/Identity:0’’’’’’’’’tensorflow/serving/predict