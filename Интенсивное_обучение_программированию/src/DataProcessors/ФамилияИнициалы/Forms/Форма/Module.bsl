#Область ОписаниеПеременных

&НаКлиенте
Перем Массив; 

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ФИОПриИзменении(Элемент)
	
	ПослеВводаФИО();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПослеВводаФИО()
	
	Если Объект.ФИО = Неопределено Тогда
		
		Сообщить("Введите ФИО полностью");
		Возврат;
		
	КонецЕсли;
	
	ПреобразоватьФИО();
	
КонецПроцедуры

&НаКлиенте
Процедура ПреобразоватьФИО()
	
	Массив = СтрРазделить(Объект.ФИО, " ");
	
	Объект.ФамилияИнициалы = СтрШаблон("%1 %2.%3.",Массив[0], Лев(Строка(Массив[1]), 1), 
							Лев(Строка(Массив[2]), 1));
КонецПроцедуры

#КонецОбласти