package com.example.connectdemo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.widget.TextView;
import android.widget.Toast;

public class conect  extends AsyncTask<Void, String, String>{
	Context context;
	String mURL;
	String mMethod;
	public conect(Context con, String url, String method) {
		// TODO Auto-generated constructor stub
		context=con;
		mURL=url;
		mMethod=method;
	}
	@Override
	protected String doInBackground(Void... arg0) {
		// TODO Auto-generated method stub
		try {
			return getJson(mURL,mMethod);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "misss";		
	
	}
	private String getJson(String mURL2, String mMethod2) throws IOException {
		// TODO Auto-generated method stub
		URL url=new URL(mURL2);
		HttpURLConnection cnn=(HttpURLConnection) url.openConnection();
		cnn.setDoInput(true);
		cnn.setDoOutput(true);
		cnn.setRequestMethod(mMethod2);
		cnn.setRequestProperty("Content-Type",
				"application/x-www-form-urlencoded");
		int response=cnn.getResponseCode();
		if(response==HttpURLConnection.HTTP_OK)
		{
			
			BufferedReader b=new BufferedReader(
					new InputStreamReader(cnn.getInputStream(),"UTF-8"));
			String inputLine;
			StringBuilder respons=new StringBuilder();
			while((inputLine=b.readLine())!=null)
			{
				respons.append(inputLine);
				respons.append("\n");
			}
			b.close();
			return respons.toString();
		}
		return "chua co gi";
	}
	@Override
	protected void onPostExecute(String result)
	{
		super.onPostExecute(result);
		TextView v=(TextView) ((Activity)context).findViewById(R.id.hienthi);
		v.setText(result);
		//hiendulieu(result);
	}
	private void hiendulieu(String result) {
		// TODO Auto-generated method stub
		Toast.makeText(context, result, Toast.LENGTH_LONG).show();
	}

}
