<img src="https://user-images.githubusercontent.com/36012868/130392291-52b82b9b-fd52-424b-ba5a-b7630e9cf343.png" data-canonical-src="https://user-images.githubusercontent.com/36012868/130392291-52b82b9b-fd52-424b-ba5a-b7630e9cf343.png" height="200" width=400/>

[![English](https://img.shields.io/badge/Language-English-blue?style=plastic)](README.ru.md)

## Вариации кастомизации виджета

Ниже приведены примеры возможностей библиотеки:

![](.github/switchers_example.gif)

## Сначала предлагаю вам ознакомиться с тем, что такое контейнер и слайдеры в библиотеке

![](.github/container_sliders.png)

Библиотека позволяет менять стиль контейнеров и слайдеров с помощью полей, приведенных в таблице ниже

## Список и описание функционала:

| Поля                  | Описание                                         |
| --------------------- |:------------------------------------------------:|
| children              | Виджеты, помещаемые внутри слайдеров / обязательный |
| onSelect              | Функция принимает переменную index, которая меняется в зависимости от индекса текущего слайдера / обязательная|
| containerHeight       | Высота контейнера / обязательный |
| containerWight        | Ширина контейнера / обязательный |
| slidersColors         | Цвет каждого слайдера. Единственный цвет в массиве заполнит все слайдеры / белые по умолчанию |
| slidersGradients      | Градиент каждого слайдера. Единственный градиент в массиве заполнит все слайдеры |
| containerBorder       | Виджет рамки контейнера |
| slidersBorder         | Виджет рамки слайдера |
| containerBorderRadius | Радиус закругления углов контейнера |
| containerColor        | Цвет заливки контейнера / серые по умолчанию |
| indents               | Отступы между контейнером и слайдерами (одинаковые со всех сторон) / 0 по умолчанию |
| direction             | Определение направления свайпа слайдера / горизонтально по умолчанию |
| containerBoxShadow    | Тень, отбрасываемая контейнером |
| containerBoxShadow    | Возможность нажать на текущий слайдер, изменив его индекс на противоположный (доступно только для 2 children) / false по умолчанию |

## Создание своего SlideSwitcher

SlideSwitcher - это обычный виджет. Для его создания вам необходимо прописать обязательные параметры:
"children" - текста, иконки, картинки и любые другие виджеты, которые будут храниться в слайдерах;
"onSelect" - функция, которая выполняется во время смены фокусированного слайдера;
"containerHeight" - высота контейнера; "containerWight" - ширина контейнера. Для кастомизации виджета
вам необходимо воспользоваться необязательными параметрами из таблицы выше.

#### Минимальный функционал:

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

Для смены состояния экрана рекомендуется создать переменную, хранящую индекс текущего слайдера и вызывать ее setState
в функции "onSelect"

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

## Список исключений для случаев, которые не поддерживаются библиотекой:

| Список исключений |
| ------------:|
| Все виджеты из списка "children" не помещаются в заданный размер контейнера |
| Параметр "isAllContainerTap" может быть "true" только тогда, когда длина "children" равна 2 |

*Первая ошибка из таблицы возникает когда наименьшая сторона контейнера*
***(определяется по направлению свайпа)***
*умноженная на длину "children" пополам больше наибольшей стороны контейнера.*
*Возникает только при максимально закругленных краях контейнера*

# НОВОЕ
## Вертикальные свитчеры

![](.github/vertical_switchers.png)

Параметр direction этой библиотеки отвечает за направление движения свитчера.
Просто добавьте **direction: Axis.vertical** к вашему виджету:

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

## Пустые свитчеры

![](.github/switch_on.png)

Если вам необходим свитчер с двумя children, для определения включения/выключения чего либо, тогда
добавьте пустые контейнеры в параметры children и параметр **isAllContainerTap: true**:

```
SlideSwitcher(
  children: [
    Container(),
    Container(),
  ],
  onSelect: (index) {},
  isAllContainerTap: true,
  containerHeight: 30,
  containerWight: 60,
),
```

[Google форма для пожеланий и предложений по пакету](https://forms.gle/3Hghayy4yTnj1mjt7)