package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BitmapType;
   
   public class TagDefineBitsJPEG4 extends TagDefineBitsJPEG3 implements IDefinitionTag
   {
      public static const TYPE:uint = 90;
      
      public var deblockParam:Number;
      
      public function TagDefineBitsJPEG4()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         _characterId = param1.readUI16();
         var _loc5_:uint = param1.readUI32();
         this.deblockParam = param1.readFIXED8();
         param1.readBytes(_bitmapData,0,_loc5_);
         if(bitmapData[0] == 255 && (bitmapData[1] == 216 || bitmapData[1] == 217))
         {
            bitmapType = BitmapType.JPEG;
         }
         else if(bitmapData[0] == 137 && bitmapData[1] == 80 && bitmapData[2] == 78 && bitmapData[3] == 71 && bitmapData[4] == 13 && bitmapData[5] == 10 && bitmapData[6] == 26 && bitmapData[7] == 10)
         {
            bitmapType = BitmapType.PNG;
         }
         else if(bitmapData[0] == 71 && bitmapData[1] == 73 && bitmapData[2] == 70 && bitmapData[3] == 56 && bitmapData[4] == 57 && bitmapData[5] == 97)
         {
            bitmapType = BitmapType.GIF89A;
         }
         var _loc6_:uint = uint(param2 - _loc5_ - 6);
         if(_loc6_ > 0)
         {
            param1.readBytes(_bitmapAlphaData,0,_loc6_);
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,_bitmapData.length + _bitmapAlphaData.length + 6,true);
         param1.writeUI16(characterId);
         param1.writeUI32(_bitmapData.length);
         param1.writeFIXED8(this.deblockParam);
         if(_bitmapData.length > 0)
         {
            param1.writeBytes(_bitmapData);
         }
         if(_bitmapAlphaData.length > 0)
         {
            param1.writeBytes(_bitmapAlphaData);
         }
      }
      
      override public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBitsJPEG4 = new TagDefineBitsJPEG4();
         _loc1_.characterId = characterId;
         _loc1_.bitmapType = bitmapType;
         _loc1_.deblockParam = this.deblockParam;
         if(_bitmapData.length > 0)
         {
            _loc1_.bitmapData.writeBytes(_bitmapData);
         }
         if(_bitmapAlphaData.length > 0)
         {
            _loc1_.bitmapAlphaData.writeBytes(_bitmapAlphaData);
         }
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineBitsJPEG4";
      }
      
      override public function get version() : uint
      {
         return 10;
      }
      
      override public function get level() : uint
      {
         return 4;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Type: " + BitmapType.toString(bitmapType) + ", " + "DeblockParam: " + this.deblockParam + ", " + "HasAlphaData: " + (_bitmapAlphaData.length > 0) + ", " + (_bitmapAlphaData.length > 0 ? "BitmapAlphaLength: " + _bitmapAlphaData.length + ", " : "") + "BitmapLength: " + _bitmapData.length;
      }
   }
}

