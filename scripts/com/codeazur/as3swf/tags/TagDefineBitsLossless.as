package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BitmapFormat;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   
   public class TagDefineBitsLossless implements IDefinitionTag
   {
      public static const TYPE:uint = 20;
      
      public var bitmapFormat:uint;
      
      public var bitmapWidth:uint;
      
      public var bitmapHeight:uint;
      
      public var bitmapColorTableSize:uint;
      
      protected var _characterId:uint;
      
      protected var _zlibBitmapData:ByteArray;
      
      public var _15076:Boolean = true;
      
      public var instance:BitmapData;
      
      public var _15075:int;
      
      public var _15077:Boolean = false;
      
      public var bmpData:BitmapData;
      
      public function TagDefineBitsLossless()
      {
         super();
         this._zlibBitmapData = new ByteArray();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get zlibBitmapData() : ByteArray
      {
         return this._zlibBitmapData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         this.bitmapFormat = param1.readUI8();
         this.bitmapWidth = param1.readUI16();
         this.bitmapHeight = param1.readUI16();
         if(this.bitmapFormat == BitmapFormat.BIT_8)
         {
            this.bitmapColorTableSize = param1.readUI8();
         }
         param1.readBytes(this.zlibBitmapData,0,param2 - (this.bitmapFormat == BitmapFormat.BIT_8 ? 8 : 7));
      }
      
      public function exportBitmapData() : void
      {
         var _loc2_:* = false;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:uint = 0;
         var _loc12_:* = 0;
         var _loc1_:ByteArray = new ByteArray();
         this.zlibBitmapData.position = 0;
         this.zlibBitmapData.readBytes(_loc1_);
         _loc1_.uncompress();
         _loc2_ = this is TagDefineBitsLossless2;
         this.bmpData = new BitmapData(this.bitmapWidth,this.bitmapHeight,_loc2_);
         switch(this.bitmapFormat)
         {
            case 3:
               _loc3_ = [];
               _loc4_ = _loc2_ ? 4 : 3;
               _loc6_ = 0;
               while(_loc6_ < this.bitmapColorTableSize + 1)
               {
                  _loc7_ = int(_loc1_[_loc6_ * _loc4_]);
                  _loc8_ = int(_loc1_[_loc6_ * _loc4_ + 1]);
                  _loc9_ = int(_loc1_[_loc6_ * _loc4_ + 2]);
                  _loc3_[_loc6_] = _loc7_ << 16 | _loc8_ << 8 | _loc9_;
                  if(_loc4_ == 4)
                  {
                     _loc3_[_loc6_] |= _loc1_[_loc6_ * _loc4_ + 3] << 24;
                  }
                  else
                  {
                     _loc3_[_loc6_] |= 4278190080;
                  }
                  _loc6_++;
               }
               _loc1_.position = (this.bitmapColorTableSize + 1) * _loc4_;
               _loc5_ = (this.bitmapWidth + 3 & ~3) - this.bitmapWidth;
               _loc6_ = 0;
               while(_loc6_ < this.bitmapHeight)
               {
                  _loc10_ = 0;
                  while(_loc10_ < this.bitmapWidth)
                  {
                     this.bmpData.setPixel32(_loc10_,_loc6_,_loc3_[_loc1_.readUnsignedByte()]);
                     _loc10_++;
                  }
                  _loc1_.position += _loc5_;
                  _loc6_++;
               }
               break;
            case 5:
               _loc1_.position = 0;
               if(_loc2_)
               {
                  _loc6_ = 0;
                  while(_loc6_ < this.bitmapHeight)
                  {
                     _loc10_ = 0;
                     while(_loc10_ < this.bitmapWidth)
                     {
                        _loc11_ = _loc1_.readUnsignedInt();
                        if((_loc12_ = _loc11_ >> 24 & 0xFF) != 0 && _loc12_ != 255)
                        {
                           _loc7_ = (_loc11_ >> 16 & 0xFF) * 255 / _loc12_;
                           if(_loc7_ > 255)
                           {
                              _loc7_ = 255;
                           }
                           _loc8_ = (_loc11_ >> 8 & 0xFF) * 255 / _loc12_;
                           if(_loc8_ > 255)
                           {
                              _loc8_ = 255;
                           }
                           _loc9_ = (_loc11_ & 0xFF) * 255 / _loc12_;
                           if(_loc9_ > 255)
                           {
                              _loc9_ = 255;
                           }
                           _loc11_ = uint(_loc12_ << 24 | _loc7_ << 16 | _loc8_ << 8 | _loc9_);
                        }
                        this.bmpData.setPixel32(_loc10_,_loc6_,_loc11_);
                        _loc10_++;
                     }
                     _loc6_++;
                  }
               }
               else
               {
                  _loc6_ = 0;
                  while(_loc6_ < this.bitmapHeight)
                  {
                     _loc10_ = 0;
                     while(_loc10_ < this.bitmapWidth)
                     {
                        this.bmpData.setPixel(_loc10_,_loc6_,_loc1_.readUnsignedInt());
                        _loc10_++;
                     }
                     _loc6_++;
                  }
               }
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this._characterId);
         _loc3_.writeUI8(this.bitmapFormat);
         _loc3_.writeUI16(this.bitmapWidth);
         _loc3_.writeUI16(this.bitmapHeight);
         if(this.bitmapFormat == BitmapFormat.BIT_8)
         {
            _loc3_.writeUI8(this.bitmapColorTableSize);
         }
         if(this._zlibBitmapData.length > 0)
         {
            _loc3_.writeBytes(this._zlibBitmapData);
         }
         param1.writeTagHeader(this.type,_loc3_.length,true);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBitsLossless = new TagDefineBitsLossless();
         _loc1_.characterId = this.characterId;
         _loc1_.bitmapFormat = this.bitmapFormat;
         _loc1_.bitmapWidth = this.bitmapWidth;
         _loc1_.bitmapHeight = this.bitmapHeight;
         if(this._zlibBitmapData.length > 0)
         {
            _loc1_.zlibBitmapData.writeBytes(this._zlibBitmapData);
         }
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineBitsLossless";
      }
      
      public function get version() : uint
      {
         return 2;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Format: " + BitmapFormat.toString(this.bitmapFormat) + ", " + "Size: (" + this.bitmapWidth + "," + this.bitmapHeight + ")";
      }
   }
}

