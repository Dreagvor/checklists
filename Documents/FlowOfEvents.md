# Поток событий

### 1. Создание раздела задач.
**Основной поток событий:**
1. Вариант использования начинается, когда пользователь нажимает на кнопку "+" в верхнем правом углу дисплея.
2. После нажатия кнопки "+" перед пользователем появляется окно со следующими элементами:
а) поле для ввода названия нового раздела с надписью "Name of the list";
б) поле с названием "icon" для выбора иконки раздела;
в) кнопки в верхней части экрана: "Done", "Cancel".
3. При нажатии кнопки "Cancel" переход к п.11.
4. При нажатии на поле для ввода названия на экране появляется клавиатура, после чего необходимо ввести название для раздела задач.
5. При нажатии на поле с названием "icon" на экране появляется окно с иконками. При нажатии на икноку происходит выбор данной иконки. 
6. При нажатии на кнопку "Done" переход к п.7
7. Производится проверка на наличие введенного названия раздела задач. Если поле названия раздела задач пусто то п.8, если не пустое - п.9
8. Появлется уведомление о том, что поле названия раздела задач пустое, переход к п.4.
9. Происходит создание раздела задач и переход к п.10.
10. Проверяется была ли выбрана иконка, если нет - то п.11, если да - она устанавливается на раздел задач и переход к п.11.
11. Возвращение пользователя в начальное меню приложения.
12. Вариант использования завершается.

### 2. Выбор раздела задач.
**Основной поток событий:**
1. Вариант использования начинается с открытия приложения.
2. Пользователь выбирает раздел задач нажимая строку с названием этого раздела.
3. Вариант использования завершается.

### 3. Редактирование раздела задач.
**Основной поток событий:**
1. Вариант использования начинается, когда пользователь нажимает на кнопку ">" в правой части строки с названием раздела задач.
2. После нажатия ">" перед пользователем появляется окно со следующими элементами:
а) поле для редактирования названия раздела";
б) поле с названием "icon" для выбора иконки раздела;
в) кнопки в верхней части экрана: "Done", "Cancel".
3. При нажатии кнопки "Cancel" переход к п.11.
4. При нажатии на поле для редактирования названия раздела задач на экране появляется клавиатура, после чего необходимо изменить название для раздела задач.
5. При нажатии на поле с названием "icon" на экране появляется окно с иконками. При нажатии на икноку происходит установка данной иконки
на раздел задач. 
6. При нажатии на кнопку "Done" переход к п.7
7. Производится проверка на наличие введенного названия раздела задач. Если поле названия раздела задач пусто то п.8, если не пустое - п.9
8. Появлется уведомление о том, что поле названия раздела задач пустое, переход к п.4.
9. Происходит редактирование названия раздела задач и переход к п.10.
10. Проверяется была ли выбрана/изменена иконка, если нет - то п.11, если да - она изменяется на новую и переход к п.11.
11. Возвращение пользователя в начальное меню приложения.
12. Вариант использования завершается.

### 4. Создание задачи.
**Основной поток событий:**
1. Вариант использования начинается, когда пользователь переходит в раздел задач и нажимает на кнопку "+" в верхнем правом углу дисплея.
2. После нажатия кнопки "+" перед пользователем появляется окно со следующими элементами:
а) поле для ввода названия новой задачи с надписью "Name of the Item";
б) поле с названием "Remind Me" c переключателем;
в) поле с названием "Due Date" с датой и временем;
г) кнопки в верхней части экрана: "Done", "Cancel".
3. При нажатии кнопки "Cancel" переход к п.11.
4. При нажатии на поле для ввода названия задачи на экране появляется клавиатура, после чего необходимо ввести название задачи.
5. При нажатии на переключатель на поле с названием "Remind Me", ползунок двигается. Зеленый цвет переключателя - напоминание включено,
серый цвет - выключено.
6. При нажатии на дату на поле "Due Date" появляется окно с датами и временем. Для установки задачи на определенную дату и время 
необходимо прокрутить каждое поле ( дата, время) и выбрать необходимое нажатием.
7. При нажатии на кнопку "Done" переход к п.8 .
8. Производится проверка на наличие введенного названия задачи. Если поле названия задачи пусто то п.9, если не пустое - п.10.
9. Появлется уведомление о том, что поле названия раздела задач пустое.
10. Происходит создание задачи с указанной датой и временем и переход к п.11.
11. Проверяется в каком положении находится переключатель. Если "вкл" - то задача в установленное число и время уведомит пользоователя о себе и п.12., если "выкл" - п.12.
12. Возвращение пользователя в начальное меню приложения.
13. Вариант использования завершается.

### 5. Редактирование задачи.
**Основной поток событий:**
1. Вариант использования начинается, когда пользователь переходит в раздел задач и нажимает на кнопку ">" справа в строке с названием задачи.
2. После нажатия плюса перед пользователем появляется окно со следующими элементами:
а) поле для редактирования задачи;
б) поле с названием "Remind Me" c переключателем;
в) поле с названием "Due Date" с датой и временем;
г) кнопки в верхней части экрана: "Done", "Cancel".
3. При нажатии кнопки "Cancel" переход к п.11
4. При нажатии на поле для редактирования названия задачи на экране появляется клавиатура, после чего необходимо изменить название задачи.
5. При нажатии на переключатель на поле с названием "Remind Me", ползунок двигается. Зеленый цвет переключателя - напоминание включено,
серый цвет - выключено.
6. При нажатии на дату на поле "Due Date" появляется окно с датами и временем. Для измениния даты и времени задачи
необходимо прокрутить каждое поле ( дата, время) и выбрать необходимое нажатием.
7. При нажатии на кнопку "Done" переход к п.8 
8. Производится проверка на наличие введенного названия раздела задач. Если поле названия раздела задач пусто то п.9, если не пустое - п.10
9. Появлется уведомление о том, что поле названия раздела задач пустое, переход к п.4.
10. Происходит изменение названия задачи, числа и времени и переход к п.11.
11. Проверяется в каком положении находится переключатель. Если "вкл" - то задача в установленное число и время уведомит пользоователя о себе и п.12., если "выкл" -то не уведомит и п.12.
12. Возвращение пользователя в начальное меню приложения.
13. Вариант использования завершается.

### 6. Переключение иконки задачи на "выполнено".
**Основной поток событий:**
1. Вариант использования начинается, когда пользователь переходит в раздел задач и нажимает на строку с названием задачи.
2. При нажатии на название задачи левее названия появляется зеленая галочка.
3. Вариант использования завершается.