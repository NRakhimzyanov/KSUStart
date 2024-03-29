#Область СлужебныеПроцедурыИФункции

Функция ПроверитьОтрицательныеОстаткиТовара(СсылкаНаРН, ДатаОтбора) Экспорт
	
	ГраницаОтбора = Новый Граница(ДатаОтбора, ВидГраницы.Включая);
		
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ОстаткиНоменклатурыОстатки.Номенклатура КАК Номенклатура,
		|	ОстаткиНоменклатурыОстатки.КоличествоОстаток КАК КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиНоменклатуры.Остатки(&ДатаОтбора, Номенклатура В
		|		(ВЫБРАТЬ
		|			РасходнаяНакладнаяСписокТоваров.Товар КАК Товар
		|		ИЗ
		|			Документ.РасходнаяНакладная.СписокТоваров КАК РасходнаяНакладнаяСписокТоваров
		|		ГДЕ
		|			РасходнаяНакладнаяСписокТоваров.Ссылка = &СсылкаРН)) КАК ОстаткиНоменклатурыОстатки
		|ГДЕ
		|	ОстаткиНоменклатурыОстатки.КоличествоОстаток < 0";
			
	Запрос.УстановитьПараметр("СсылкаРН", СсылкаНаРН);
	Запрос.УстановитьПараметр("ДатаОтбора", ГраницаОтбора);
	РезультатЗапроса = Запрос.Выполнить();

		Если РезультатЗапроса.Пустой() Тогда
			
			Возврат Ложь;
			
		КонецЕсли;
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			
			СтрокаВывода = СтрШаблон("Не хватает товара ""%1"" в количестве %2 шт.",
						ВыборкаДетальныеЗаписи.Номенклатура, -(ВыборкаДетальныеЗаписи.КоличествоОстаток));
			Сообщить(СтрокаВывода);
			
		КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

Функция ПроверитьОтрицательныеОстаткиМатериала(СсылкаНаПП, ДатаОтбора) Экспорт
	
	ГраницаОтбора = Новый Граница(ДатаОтбора, ВидГраницы.Включая);
		
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ОстаткиНоменклатурыОстатки.Номенклатура КАК Номенклатура,
		|	ОстаткиНоменклатурыОстатки.КоличествоОстаток КАК КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиНоменклатуры.Остатки(&ДатаОтбора, Номенклатура В
		|		(ВЫБРАТЬ
		|			ПроизводствоПродукцииСписокМатериалов.Материал КАК Материал
		|		ИЗ
		|			Документ.ПроизводствоПродукции.СписокМатериалов КАК ПроизводствоПродукцииСписокМатериалов
		|		ГДЕ
		|			ПроизводствоПродукцииСписокМатериалов.Ссылка = &СсылкаПП)) КАК ОстаткиНоменклатурыОстатки
		|ГДЕ
		|	ОстаткиНоменклатурыОстатки.КоличествоОстаток < 0";
			
	Запрос.УстановитьПараметр("СсылкаПП", СсылкаНаПП);
	Запрос.УстановитьПараметр("ДатаОтбора", ГраницаОтбора);
	РезультатЗапроса = Запрос.Выполнить();

		Если РезультатЗапроса.Пустой() Тогда
			
			Возврат Ложь;
			
		КонецЕсли;
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			
			СтрокаВывода = СтрШаблон("Не хватает товара ""%1"" в количестве %2 единиц.",
						ВыборкаДетальныеЗаписи.Номенклатура, -(ВыборкаДетальныеЗаписи.КоличествоОстаток));
			Сообщить(СтрокаВывода);
			
		КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

#КонецОбласти