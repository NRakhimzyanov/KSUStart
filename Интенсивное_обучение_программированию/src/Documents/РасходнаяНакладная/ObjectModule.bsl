#Область СлужебныеПроцедурыИФункции

Процедура ОбработкаПроведения(Отказ,Режим)
	
	Движения.Продажи.Записывать = Истина;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	РасходнаяНакладнаяСписокТоваров.Товар,
		|	СУММА(РасходнаяНакладнаяСписокТоваров.Количество) КАК Количество,
		|	СУММА(РасходнаяНакладнаяСписокТоваров.Сумма) КАК Сумма
		|ИЗ
		|	Документ.РасходнаяНакладная.СписокТоваров КАК РасходнаяНакладнаяСписокТоваров
		|ГДЕ
		|	РасходнаяНакладнаяСписокТоваров.Ссылка = &Ссылка
		|СГРУППИРОВАТЬ ПО
		|	РасходнаяНакладнаяСписокТоваров.Товар";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Движение 				= Движения.Продажи.Добавить();
		Движение.Период 		= Дата;
		Движение.Контрагент 	= Клиент;		
		Движение.Номенклатура 	= ВыборкаДетальныеЗаписи.Товар;
		Движение.Количество 	= ВыборкаДетальныеЗаписи.Количество;
		Движение.Сумма 			= ВыборкаДетальныеЗаписи.Сумма;
	КонецЦикла;


	Запрос1 = Новый Запрос;
	Запрос1.Текст =
		"ВЫБРАТЬ
		|	РасходнаяНакладнаяСписокУслуг.Услуга,
		|	СУММА(РасходнаяНакладнаяСписокУслуг.Сумма) КАК Сумма,
		|	КОЛИЧЕСТВО(РасходнаяНакладнаяСписокУслуг.Сумма) КАК Количество
		|ИЗ
		|	Документ.РасходнаяНакладная.СписокУслуг КАК РасходнаяНакладнаяСписокУслуг
		|ГДЕ
		|	РасходнаяНакладнаяСписокУслуг.Ссылка = &Ссылка
		|СГРУППИРОВАТЬ ПО
		|	РасходнаяНакладнаяСписокУслуг.Услуга";
	
	Запрос1.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса1 = Запрос1.Выполнить();
	
	ВыборкаДетальныеЗаписи1 = РезультатЗапроса1.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи1.Следующий() Цикл
		Движение 				= Движения.Продажи.Добавить();
		Движение.Период 		= Дата;
		Движение.Контрагент 	= Клиент;
		Движение.Номенклатура 	= ВыборкаДетальныеЗаписи1.Услуга;
		Движение.Количество 	= ВыборкаДетальныеЗаписи1.Количество;
		Движение.Сумма 			= ВыборкаДетальныеЗаписи1.Сумма;
	КонецЦикла;
	

КонецПроцедуры

#КонецОбласти

