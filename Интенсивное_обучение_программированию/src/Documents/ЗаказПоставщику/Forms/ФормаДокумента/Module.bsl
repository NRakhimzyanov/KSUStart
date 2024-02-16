
#Область ОбработчикиСобытийЭлементовТаблицыФормыСписокМатериалов

&НаКлиенте
Процедура СписокМатериаловЦенаПриИзменении(Элемент)
	
	РасчетСтрокиТоваровСписокМатериалов();
	
КонецПроцедуры

&НаКлиенте
Процедура СписокМатериаловКоличествоПриИзменении(Элемент)
	
	РасчетСтрокиТоваровСписокМатериалов();
	
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыСписокРасходников

&НаКлиенте
Процедура СписокРасходниковЦенаПриИзменении(Элемент)
	
	РасчетСтрокиТоваровСписокРасходников();
	
КонецПроцедуры

&НаКлиенте
Процедура СписокРасходниковКоличествоПриИзменении(Элемент)
	
	РасчетСтрокиТоваровСписокРасходников();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РасчетСтрокиТоваровСписокМатериалов()
	
	СтрокаРасчета 		= Элементы.СписокМатериалов.ТекущиеДанные;
	СтрокаРасчета.Сумма = СтрокаРасчета.Цена * СтрокаРасчета.Количество;
	
КонецПроцедуры

&НаКлиенте
Процедура РасчетСтрокиТоваровСписокРасходников()
	
	СтрокаРасчета 		= Элементы.СписокРасходников.ТекущиеДанные;
	СтрокаРасчета.Сумма = СтрокаРасчета.Цена * СтрокаРасчета.Количество;
	
КонецПроцедуры

#КонецОбласти