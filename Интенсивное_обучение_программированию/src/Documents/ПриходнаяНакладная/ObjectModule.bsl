#Область СлужебныеПроцедурыИФункции

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказПоставщику") Тогда
		
		Договор   = ДанныеЗаполнения.Договор;
		Поставщик = ДанныеЗаполнения.Поставщик;
		Основание = ДанныеЗаполнения.Ссылка;
		Для Каждого ТекСтрокаСписокМатериалов Из ДанныеЗаполнения.СписокМатериалов Цикл
			НоваяСтрока 			= СписокМатериалов.Добавить();
			НоваяСтрока.Количество 	= ТекСтрокаСписокМатериалов.Количество;
			НоваяСтрока.Материал 	= ТекСтрокаСписокМатериалов.Материал;
			НоваяСтрока.Сумма 		= ТекСтрокаСписокМатериалов.Сумма;
			НоваяСтрока.Цена 		= ТекСтрокаСписокМатериалов.Цена;
		КонецЦикла;
		Для Каждого ТекСтрокаСписокРасходников Из ДанныеЗаполнения.СписокРасходников Цикл
			НоваяСтрока 			= СписокРасходников.Добавить();
			НоваяСтрока.Количество 	= ТекСтрокаСписокРасходников.Количество;
			НоваяСтрока.Расходник 	= ТекСтрокаСписокРасходников.Расходник;
			НоваяСтрока.Сумма 		= ТекСтрокаСписокРасходников.Сумма;
			НоваяСтрока.Цена 		= ТекСтрокаСписокРасходников.Цена;
		КонецЦикла;
	
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

