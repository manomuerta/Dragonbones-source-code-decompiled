package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFSymbol
   {
      public var tagId:uint;
      
      public var name:String;
      
      public function SWFSymbol(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public static function create(param1:uint, param2:String) : SWFSymbol
      {
         var _loc3_:SWFSymbol = new SWFSymbol();
         _loc3_.tagId = param1;
         _loc3_.name = param2;
         return _loc3_;
      }
      
      public function parse(param1:SWFData) : void
      {
         this.tagId = param1.readUI16();
         this.name = param1.readString();
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeUI16(this.tagId);
         param1.writeString(this.name);
      }
      
      public function toString() : String
      {
         return "TagID: " + this.tagId + ", Name: " + this.name;
      }
   }
}

