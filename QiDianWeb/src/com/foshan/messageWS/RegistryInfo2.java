
package com.foshan.messageWS;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>RegistryInfo2 complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="RegistryInfo2"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="RESULT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="REGISTRYCODE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SERVICECODE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="BALANCE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="CREATEDATE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="REGISTRYSTATEID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="PRIORITY" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="FIRSTREGISTRYDATE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="REGISTRYDATE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="AGENTID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="PRODUCTNAME" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="DESTMOBILE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="FLAG" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="REPLYCONTENT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="ISRETURN" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="VERSION" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="GRADE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="PARENT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SUBSIDIARY" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="ROLES" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="BALSTATUS" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="DISCOUNT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SLIST" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="POPM" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="UPDATE" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="MMS" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RegistryInfo2", propOrder = {
    "result",
    "registrycode",
    "servicecode",
    "balance",
    "createdate",
    "registrystateid",
    "priority",
    "firstregistrydate",
    "registrydate",
    "agentid",
    "productname",
    "destmobile",
    "flag",
    "replycontent",
    "isreturn",
    "version",
    "grade",
    "parent",
    "subsidiary",
    "roles",
    "balstatus",
    "discount",
    "slist",
    "popm",
    "update",
    "mms"
})
public class RegistryInfo2 {

    @XmlElement(name = "RESULT")
    protected String result;
    @XmlElement(name = "REGISTRYCODE")
    protected String registrycode;
    @XmlElement(name = "SERVICECODE")
    protected String servicecode;
    @XmlElement(name = "BALANCE")
    protected String balance;
    @XmlElement(name = "CREATEDATE")
    protected String createdate;
    @XmlElement(name = "REGISTRYSTATEID")
    protected String registrystateid;
    @XmlElement(name = "PRIORITY")
    protected String priority;
    @XmlElement(name = "FIRSTREGISTRYDATE")
    protected String firstregistrydate;
    @XmlElement(name = "REGISTRYDATE")
    protected String registrydate;
    @XmlElement(name = "AGENTID")
    protected String agentid;
    @XmlElement(name = "PRODUCTNAME")
    protected String productname;
    @XmlElement(name = "DESTMOBILE")
    protected String destmobile;
    @XmlElement(name = "FLAG")
    protected String flag;
    @XmlElement(name = "REPLYCONTENT")
    protected String replycontent;
    @XmlElement(name = "ISRETURN")
    protected String isreturn;
    @XmlElement(name = "VERSION")
    protected String version;
    @XmlElement(name = "GRADE")
    protected String grade;
    @XmlElement(name = "PARENT")
    protected String parent;
    @XmlElement(name = "SUBSIDIARY")
    protected String subsidiary;
    @XmlElement(name = "ROLES")
    protected String roles;
    @XmlElement(name = "BALSTATUS")
    protected String balstatus;
    @XmlElement(name = "DISCOUNT")
    protected String discount;
    @XmlElement(name = "SLIST")
    protected String slist;
    @XmlElement(name = "POPM")
    protected String popm;
    @XmlElement(name = "UPDATE")
    protected String update;
    @XmlElement(name = "MMS")
    protected String mms;

    /**
     * ��ȡresult���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRESULT() {
        return result;
    }

    /**
     * ����result���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRESULT(String value) {
        this.result = value;
    }

    /**
     * ��ȡregistrycode���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getREGISTRYCODE() {
        return registrycode;
    }

    /**
     * ����registrycode���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setREGISTRYCODE(String value) {
        this.registrycode = value;
    }

    /**
     * ��ȡservicecode���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSERVICECODE() {
        return servicecode;
    }

    /**
     * ����servicecode���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSERVICECODE(String value) {
        this.servicecode = value;
    }

    /**
     * ��ȡbalance���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBALANCE() {
        return balance;
    }

    /**
     * ����balance���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBALANCE(String value) {
        this.balance = value;
    }

    /**
     * ��ȡcreatedate���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCREATEDATE() {
        return createdate;
    }

    /**
     * ����createdate���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCREATEDATE(String value) {
        this.createdate = value;
    }

    /**
     * ��ȡregistrystateid���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getREGISTRYSTATEID() {
        return registrystateid;
    }

    /**
     * ����registrystateid���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setREGISTRYSTATEID(String value) {
        this.registrystateid = value;
    }

    /**
     * ��ȡpriority���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPRIORITY() {
        return priority;
    }

    /**
     * ����priority���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPRIORITY(String value) {
        this.priority = value;
    }

    /**
     * ��ȡfirstregistrydate���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFIRSTREGISTRYDATE() {
        return firstregistrydate;
    }

    /**
     * ����firstregistrydate���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFIRSTREGISTRYDATE(String value) {
        this.firstregistrydate = value;
    }

    /**
     * ��ȡregistrydate���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getREGISTRYDATE() {
        return registrydate;
    }

    /**
     * ����registrydate���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setREGISTRYDATE(String value) {
        this.registrydate = value;
    }

    /**
     * ��ȡagentid���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAGENTID() {
        return agentid;
    }

    /**
     * ����agentid���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAGENTID(String value) {
        this.agentid = value;
    }

    /**
     * ��ȡproductname���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPRODUCTNAME() {
        return productname;
    }

    /**
     * ����productname���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPRODUCTNAME(String value) {
        this.productname = value;
    }

    /**
     * ��ȡdestmobile���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDESTMOBILE() {
        return destmobile;
    }

    /**
     * ����destmobile���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDESTMOBILE(String value) {
        this.destmobile = value;
    }

    /**
     * ��ȡflag���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFLAG() {
        return flag;
    }

    /**
     * ����flag���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFLAG(String value) {
        this.flag = value;
    }

    /**
     * ��ȡreplycontent���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getREPLYCONTENT() {
        return replycontent;
    }

    /**
     * ����replycontent���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setREPLYCONTENT(String value) {
        this.replycontent = value;
    }

    /**
     * ��ȡisreturn���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getISRETURN() {
        return isreturn;
    }

    /**
     * ����isreturn���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setISRETURN(String value) {
        this.isreturn = value;
    }

    /**
     * ��ȡversion���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVERSION() {
        return version;
    }

    /**
     * ����version���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVERSION(String value) {
        this.version = value;
    }

    /**
     * ��ȡgrade���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGRADE() {
        return grade;
    }

    /**
     * ����grade���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGRADE(String value) {
        this.grade = value;
    }

    /**
     * ��ȡparent���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPARENT() {
        return parent;
    }

    /**
     * ����parent���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPARENT(String value) {
        this.parent = value;
    }

    /**
     * ��ȡsubsidiary���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSUBSIDIARY() {
        return subsidiary;
    }

    /**
     * ����subsidiary���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSUBSIDIARY(String value) {
        this.subsidiary = value;
    }

    /**
     * ��ȡroles���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getROLES() {
        return roles;
    }

    /**
     * ����roles���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setROLES(String value) {
        this.roles = value;
    }

    /**
     * ��ȡbalstatus���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBALSTATUS() {
        return balstatus;
    }

    /**
     * ����balstatus���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBALSTATUS(String value) {
        this.balstatus = value;
    }

    /**
     * ��ȡdiscount���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDISCOUNT() {
        return discount;
    }

    /**
     * ����discount���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDISCOUNT(String value) {
        this.discount = value;
    }

    /**
     * ��ȡslist���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSLIST() {
        return slist;
    }

    /**
     * ����slist���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSLIST(String value) {
        this.slist = value;
    }

    /**
     * ��ȡpopm���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPOPM() {
        return popm;
    }

    /**
     * ����popm���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPOPM(String value) {
        this.popm = value;
    }

    /**
     * ��ȡupdate���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUPDATE() {
        return update;
    }

    /**
     * ����update���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUPDATE(String value) {
        this.update = value;
    }

    /**
     * ��ȡmms���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMMS() {
        return mms;
    }

    /**
     * ����mms���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMMS(String value) {
        this.mms = value;
    }

}
