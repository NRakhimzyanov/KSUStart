
#Область ОбработчикиСобытий

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если ОбменДанными.Загрузка Тогда
    	Возврат;
	КонецЕсли;
	
	ИтоговаяСумма = СписокМатериалов.Итог("Сумма") + СписокРасходников.Итог("Сумма");

КонецПроцедуры

#КонецЕсли

#КонецОбласти