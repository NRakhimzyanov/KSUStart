#Область ОписаниеПеременных

&НаКлиенте
Перем Массив;

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НаименованиеПриИзменении(Элемент)
	
	ОбновитьФИО();	
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ОбновитьФИО()
		
	Если НЕ (ЗначениеЗаполнено(Объект.Фамилия) 
		ИЛИ ЗначениеЗаполнено(Объект.Имя) 
		ИЛИ ЗначениеЗаполнено(Объект.Отчество)) Тогда 
		Возврат;
	КонецЕсли; 
	
	Обработчик = Новый ОписаниеОповещения("Подключаемый_ОбновитьФИОЗавершение", ЭтотОбъект);
	ПоказатьВопрос(Обработчик,"Обновить данные ФИО?", РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Да );	

КонецПроцедуры

&НаКлиенте	
Процедура Подключаемый_ОбновитьФИОЗавершение(Ответ, ДополнительныеПараметры) Экспорт
	
	Если Ответ <> КодВозвратаДиалога.Да Тогда
		Модифицированность = Ложь;
		ЭтотОбъект.ЭтаФорма.Закрыть();
		Возврат;
	КонецЕсли;	
		
	Массив = СтрРазделить(Строка(Объект.Наименование)," ",Ложь);
	Объект.Фамилия = Массив[0];
	Объект.Имя = Массив[1];
	Объект.Отчество = Массив[2];
	
КонецПроцедуры

#КонецОбласти