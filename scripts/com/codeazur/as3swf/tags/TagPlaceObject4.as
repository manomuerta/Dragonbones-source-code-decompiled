package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   
   public class TagPlaceObject4 extends TagPlaceObject3 implements IDisplayListTag
   {
      public static const TYPE:uint = 94;
      
      public function TagPlaceObject4()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         super.parse(param1,param2,param3,param4);
         if(param1.bytesAvailable > 0)
         {
            metaData = param1.readObject();
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = _15091();
         if(metaData != null)
         {
            _loc3_.writeObject(metaData);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "PlaceObject4";
      }
      
      override public function get version() : uint
      {
         return 19;
      }
      
      override public function get level() : uint
      {
         return 4;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = super.toString(param1);
         if(metaData != null)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "MetaData: yes";
         }
         return _loc3_;
      }
   }
}

