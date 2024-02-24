#Область ОбработчикиСобытий

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

Процедура ОбработкаЗаполнения(ДанныеЗаполнения,СтандартнаяОбработка)

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.РасходнаяНакладная") Тогда
    
	    Запрос = Новый Запрос;
	    Запрос.Текст =
	    	"ВЫБРАТЬ
	    	|	РасходнаяНакладная.Клиент КАК Контрагент,
	    	|	РасходнаяНакладная.Договор,
	    	|	РасходнаяНакладная.ИтоговаяСумма КАК Сумма,
	    	|	РасходнаяНакладная.Ссылка КАК Основание
	    	|ИЗ
	    	|	Документ.РасходнаяНакладная КАК РасходнаяНакладная
	    	|ГДЕ
	    	|	РасходнаяНакладная.Ссылка = &Ссылка";
	    
	    Запрос.УстановитьПараметр("Ссылка", ДанныеЗаполнения);
	    РезультатЗапроса = Запрос.Выполнить();

	    ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	    ВыборкаДетальныеЗаписи.Следующий();
	    ЗаполнитьЗначенияСвойств(ЭтотОбъект, ВыборкаДетальныеЗаписи);

	КонецЕсли;

КонецПроцедуры

#КонецЕсли

#КонецОбласти
