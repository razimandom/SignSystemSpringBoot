package com.example.SpringMySQL.controllers;

import com.example.SpringMySQL.models.DocModel;
import com.example.SpringMySQL.models.DocModelRepo;
import com.example.SpringMySQL.models.KeyModel;
import com.example.SpringMySQL.models.KeyModelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigInteger;
import java.security.*;
import java.security.spec.ECGenParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Random;

@Controller
public class MainController {

    @Autowired
    DocModelRepo docRepo;

    @Autowired
    KeyModelRepo keyRepo;

    @RequestMapping("/")
    public ModelAndView doHome(){
        ModelAndView mv = new ModelAndView( "index");
        mv.addObject("lists", docRepo.findAll());
        return mv;
    }

    @RequestMapping("/genkey/")
    public ModelAndView doGenKey(){
        ModelAndView mv = new ModelAndView( "genkey/index");
        mv.addObject("lists", keyRepo.findAll());
        return mv;
    }

    @RequestMapping("/signdoc/")
    public ModelAndView doSignDoc(){
        ModelAndView mv = new ModelAndView( "signdoc/index");
        return mv;
    }

    @RequestMapping( value = "/save", method = RequestMethod.POST)
    public ModelAndView doSave(
            @RequestParam("id") String id,
            @RequestParam("req_name") String reqName,
            @RequestParam("sign_email") String signEmail,
            @RequestParam("doc_type") String docType,
            @RequestParam("doc_deadline") String docDeadline
    ) throws NoSuchAlgorithmException {


        ModelAndView mv = new ModelAndView("redirect:/");
        DocModel docs;

        if(!id.isEmpty()){
            docs = (DocModel)docRepo.findOne(Integer.parseInt(id));
        }else{
            docs = new DocModel();
        }

        // Fetch current date and time

        ZoneId zoneIdMYS = ZoneId.of("Asia/Kuala_Lumpur");
        LocalDateTime localDateTime = LocalDateTime.now(zoneIdMYS);
        DateTimeFormatter formatterTimeStamp = DateTimeFormatter.ofPattern("ddMMyyyy-HHmmss-A-N");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String currentTimeStamp = localDateTime.format(formatterTimeStamp);
        String currentDate = localDateTime.format(formatterDate);

        // Generate MD5 using timestamp

        String docIdTimestamp = currentTimeStamp;
        MessageDigest docIdTimestampMD5 = MessageDigest.getInstance("MD5");
        docIdTimestampMD5.update(docIdTimestamp.getBytes(), 0, docIdTimestamp.length());
        String docIdMD5String = new BigInteger(1, docIdTimestampMD5.digest()).toString(16);

        // Add data to DB

        docs.setReq_name(reqName);
        docs.setSign_email(signEmail);
        docs.setDoc_type(docType);
        docs.setDoc_deadline(docDeadline);
        docs.setReq_time_created(currentTimeStamp);
        docs.setReq_date_created(currentDate);
        docs.setDoc_md5(docIdMD5String);
        docs.setDoc_status("Pending");
        docRepo.save(docs);
        return mv;
    }

    @RequestMapping( value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView doView(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("view");
        mv.addObject("lists", docRepo.findOne(id));
        return mv;
    }

    @RequestMapping( value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/");
        docRepo.delete(id);
        return mv;
    }

    @RequestMapping( value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("edit");
        mv.addObject("lists", docRepo.findOne(id));
        return mv;
    }

    /*
    Generate Key Function
     */

    @RequestMapping( value = "/genkey/generate", method = RequestMethod.POST)
    public ModelAndView doGenKey(
            @RequestParam("id") String id,
            @RequestParam("passphrase") String passphrase
    ) throws NoSuchAlgorithmException, NoSuchProviderException, InvalidAlgorithmParameterException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {



        ModelAndView mv = new ModelAndView("redirect:/genkey/");
        KeyModel keys = new KeyModel();;

        // Generate Key Function

        KeyPairGenerator kpg;
        kpg = KeyPairGenerator.getInstance("EC","SunEC");
        ECGenParameterSpec ecsp;
        ecsp = new ECGenParameterSpec("sect163k1");
        kpg.initialize(ecsp);

        // Resource: https://www.ssl247.com/kb/ssl-certificates/generalinformation/what-is-rsa-dsa-ecc

            /*
             * Generate public and private key for ECC
             */

        //_log.info("Generating ECC Key");
        KeyPair kp = kpg.genKeyPair();
        PrivateKey privKey = kp.getPrivate();
        PublicKey pubKey = kp.getPublic();

            /*
             * Encode private and public key
             */

        //_log.info("Encoding private and public keys");
        byte[] privateKeyBytes = privKey.getEncoded();
        byte[] publicKeyBytes = pubKey.getEncoded();

        String encodedECCprivateKeyBytes = Base64.getEncoder().encodeToString(privateKeyBytes);
        String encodedECCpublicKeyBytes = Base64.getEncoder().encodeToString(publicKeyBytes);

        //_log.info("Generating key process completed");

            /*
             * Encryption of private key
             */

        //_log.info("Encrypting private key");

            /*
             * Generate salt
             */

        //_log.info("Generating random salt with 32 bits");
        Random r = new SecureRandom();
        byte[] salt = new byte[32];
        r.nextBytes(salt);

    		/*
    		 * Initialize iteration
    		 */

        int iteration = 200000;
        //_log.info("Initialize iteration count: " + iteration);

    		/*
    		 * Initialize bits
    		 */

        int bit = 128;
        //_log.info("Initialize bit count: " + bit);

    		/*
    		 * Initialize vector
    		 */

        //_log.info("Generate random vector with " + bit + "bit");
        byte[] vector = new byte[128/8];
        r.nextBytes(vector);
        IvParameterSpec ivspec = new IvParameterSpec(vector);

    		/*
    		 * Initialize variables
    		 */
        String MsgToEncrypt = encodedECCprivateKeyBytes;
        //String userPin = ParamUtil.getString(actionRequest, "userPin");
        Cipher ecipher;

            /*
             * Generating AES key for encryption
             */

        //_log.info("Generating AES key for encryption");
        SecretKeyFactory factory =  SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        KeySpec mykeySpec = new PBEKeySpec(passphrase.toCharArray(), salt, iteration, bit);
        SecretKey tmp = factory.generateSecret(mykeySpec);
        SecretKeySpec mySecretkey = new SecretKeySpec(tmp.getEncoded(), "AES");

            /*
             *  Create and initiate encryption
             */

        //_log.info("Initiate encryption alogrithm");
        ecipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        ecipher.init(Cipher.ENCRYPT_MODE, mySecretkey, ivspec);

            /*
             * Encrypt the private key and get bytes
             */

        //_log.info("Encrypting private key");
        byte[] encryptedMsg = ecipher.doFinal(MsgToEncrypt.getBytes());

            /*
             * Encode encrypted the private key, salt, and vector
             */

        //_log.info("Encoding encrypted private key, salt and vector");
        String encodeECCEncryptedPrivateKey = Base64.getEncoder().encodeToString(encryptedMsg);
        String encodeSalt = Base64.getEncoder().encodeToString(salt);
        String encodeVector = Base64.getEncoder().encodeToString(vector);


        System.out.println(encodeSalt);

        // Add data to DB

        keys.setPrivatekey_data(encodeECCEncryptedPrivateKey);
        keys.setPublickey_data(encodedECCpublicKeyBytes);
        keys.setSalt_data(encodeSalt);
        keys.setVector_data(encodeVector);
        keyRepo.save(keys);
        return mv;

    }
}
