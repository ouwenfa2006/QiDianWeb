
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
 *         &lt;element name="RECSMS_UTF8Result" type="{http://tempuri.org/}ArrayOfMOBody" minOccurs="0"/&gt;
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
    "recsmsutf8Result"
})
@XmlRootElement(name = "RECSMS_UTF8Response")
public class RECSMSUTF8Response {

    @XmlElement(name = "RECSMS_UTF8Result")
    protected ArrayOfMOBody recsmsutf8Result;

    /**
     * ��ȡrecsmsutf8Result���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public ArrayOfMOBody getRECSMSUTF8Result() {
        return recsmsutf8Result;
    }

    /**
     * ����recsmsutf8Result���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public void setRECSMSUTF8Result(ArrayOfMOBody value) {
        this.recsmsutf8Result = value;
    }

}
