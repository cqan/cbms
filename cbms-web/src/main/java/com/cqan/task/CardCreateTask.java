package com.cqan.task;

import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cqan.service.CardBatchService;
import com.cqan.service.CardService;
import com.cqan.system.Card;
import com.cqan.system.CardBatch;

/**
 * 生成卡任务
 * @author wuhui
 *
 */
@Component
public class CardCreateTask implements Runnable{
	
	@Autowired
	private CardBatchService cardBatchService;
	
	@Autowired
	private CardService cardService;
	
	private static final Logger logger = LoggerFactory.getLogger(CardCreateTask.class);

	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
	
	private static final int INITIALDELAY = 30;
	private static final int PERIOD = 30;
	
	private static final int CARDLEN = 10;
	
	private static boolean flag = false;
	
	
	
	public CardCreateTask(){
		if (!flag) {
			logger.debug("制卡定时任务初始化...");
			flag = true;
			scheduled.scheduleAtFixedRate(this, INITIALDELAY, PERIOD, TimeUnit.SECONDS);
		}
	}



	@Override
	public void run() {
		try {
			List<CardBatch> cardBatchs = cardBatchService.findByStatus(0);
			for (CardBatch cardBatch : cardBatchs) {
				logger.info("准备生成卡号:{}",cardBatch);
				clearCardBatch(cardBatch);
				cardBatch.setStatus(1);
				cardBatchService.save(cardBatch);
				createCard(cardBatch);
				cardBatch.setStatus(2);
				cardBatchService.save(cardBatch);
			}
		} catch (Exception e) {
			logger.error("制卡出现异常",e);
		}
	}
	
	private void createCard(CardBatch cardBatch) {
		if (cardBatch==null||cardBatch.getCardNum()<=0) {
			return;
		}
		for (int i = 1; i <= cardBatch.getCardNum(); i++) {
			Card card = new Card();
			card.setArea(cardBatch.getArea());
			card.setCardBatch(cardBatch);
			card.setCreateTime(new Date());
			card.setEndTime(cardBatch.getEndTime());
			card.setPrice(cardBatch.getPrice());
			card.setSerialNo(String.valueOf(i));
			card.setStatus(1);
			card.setFeePolicyId(cardBatch.getFeePolicyId());
			card.setPwd(createPwd());
			card.setCardNo(createCardNo(cardBatch,i));
			logger.info("生成卡号:{}",card);
			cardService.save(card);
		}
		
		
	}
	
	/**
	 * 生成卡号
	 * @param cardBatch
	 * @param i
	 * @return
	 */
	private String createCardNo(CardBatch cardBatch, int i) {
		int noLen = String.valueOf(cardBatch.getCardNum()).length();
		int cbIdLen = String.valueOf(cardBatch.getId()).length();
		StringBuffer sb = new StringBuffer();
		sb.append(StringUtils.defaultString(cardBatch.getCardPrefix(), ""))
		.append(String.valueOf(cardBatch.getId()));
		int randStrLen = CARDLEN - noLen-cbIdLen;
		return sb.append(RandomStringUtils.random(randStrLen, false, true)).append(fill(noLen, i))
				.append(StringUtils.defaultString(cardBatch.getCardSuffix(), "")).toString();
	}
	
	private String fill(int len,int i){
		int noLen = String.valueOf(i).length();
		StringBuffer sb = new StringBuffer();
		for (int j = 0; j < len-noLen; j++) {
			sb.append("0");
		}
		sb.append(i);
		return sb.toString();
	}



	private static String createPwd(){
		return RandomStringUtils.random(8, false, true);
	}

	private void clearCardBatch(CardBatch cb){
		cardService.deleteByCardBatch(cb);
	}
	
}
