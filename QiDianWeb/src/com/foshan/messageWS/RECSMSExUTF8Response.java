
package com.foshan.messageWS;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="RECSMSEx_UTF8Result" type="{http://tempuri.org/}ArrayOfMOBody" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "recsmsExUTF8Result"
})
@XmlRootElement(name = "RECSMSEx_UTF8Response")
public class RECSMSExUTF8Response {

    @XmlElement(name = "RECSMSEx_UTF8Result")
    protected ArrayOfMOBody recsmsExUTF8Result;

    /**
     * ��ȡrecsmsExUTF8Result���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public ArrayOfMOBody getRECSMSExUTF8Result() {
        return recsmsExUTF8Result;
    }

    /**
     * ����recsmsExUTF8Result���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public void setRECSMSExUTF8Result(ArrayOfMOBody value) {
        this.recsmsExUTF8Result = value;
    }

}
