# Library for creating and customizing sliders

[Русский README.md](README.ru.md)

## Widget customization variations

Here are some examples of the library's features:

![](.github/switchers_example.gif)

***The description of the library is only valid for its latest version***

## First I suggest you get familiar with what container and sliders are in the library

![](.github/container_sliders.png)

The library lets you change the style of containers and sliders using the fields in the table below

## List and description of the functionality:

| Fields           | Description                                   |
| ---------------- |:---------------------------------------------:|
| slidersChild     | Widgets that placed inside sliders / required |
| onSelect | The function takes an index variable that changes depending on the index of the current slider / required|
| containerHeight | Container height / required |
| containerWight | Container width / required |
| slidersColors | The color of each slider. A single color in the array will fill all sliders / white by default |
| slidersGradients | The gradient of each slider. A single gradient in the array will fill all sliders |
| containerBorder | Container border widget |
| slidersBorder | Slider border widget |
| containerBorderRadius | Container corner rounding radius |
| containerColor | Container fill color / grey by default |
| indents | Indents between the container and sliders (the same on all sides) / 0 by default |
| direction             | Defining the direction of the slider swipe |
| containerBoxShadow    | A shadow cast by a box |

## Creating your own SlideSwitcher

SlideSwitcher is an ordinary widget. In order to create it you have to specify the obligatory parameters:
children - texts, icons, pictures and any other widgets that will be stored in the sliders;
onSelect - the function which will be executed during the change of the focused slider;
containerHeight - container height; containerWight - container width. To customize the widget
you should use the optional parameters from the table above.

#### Minimum functionality:

```
SlideSwitcher(
  children: [
    Text('First'),
    Text('Second'),
  ],
  onSelect: (index) {},
  containerHeight: 40,
  containerWight: 350,
),
```

***Make sure that the containerHeight and containerWight parameters match the swipe movements, otherwise it's possible that the sliders will exceed the container boundaries***

To change the state of the screen it is recommended to create a variable storing the index of the current slider and call its setState
in the onSelect function

```
int switcherIndex1 = 0;

Column(
  children: [
    SlideSwitcher(
      children: [
        Text('First'),
        Text('Second'),
      ],
      onSelect: (index) => setState(() => switcherIndex1 = index),
      containerHeight: 40,
      containerWight: 350,
    ),
    const SizedBox(height: 20),
    if (switcherIndex1 == 0) ...[
      Container(height: 100, width: 100, color: Colors.red,)
    ]
    else ...[
      Container(height: 100, width: 100, color: Colors.green,)
    ],
  ],
),
```

#### NEW
##Vertical Switchers.

The direction parameter of this library is responsible for the direction of the switch's movement.
Just add ***direction: Axis.vertical*** to your widget:

```
SlideSwitcher(
  children: [
    Text('First'),
    Text('Second'),
  ],
  onSelect: (index) {},
  containerHeight: 350,
  containerWight: 40,
  direction: Axis.vertical
),
```

##Empty Switchers

If you need a switcher with two children to define whether something is on or off, then
add empty containers to the children parameters:

```
SlideSwitcher(
  children: [
    Container(),
    Container(),
  ],
  onSelect: (index) {},
  containerHeight: 30,
  containerWight: 60,
),
```

![](.github/switch_on.png)

[Google form for wishes and suggestions for the package](https://forms.gle/3Hghayy4yTnj1mjt7)
