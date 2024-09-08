package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.utils.StringUtils;
   import flash.filters.BitmapFilter;
   import flash.filters.ConvolutionFilter;
   
   public class FilterConvolution extends Filter implements IFilter
   {
      public var matrixX:uint;
      
      public var matrixY:uint;
      
      public var divisor:Number;
      
      public var bias:Number;
      
      public var defaultColor:uint;
      
      public var clamp:Boolean;
      
      public var preserveAlpha:Boolean;
      
      protected var _matrix:Vector.<Number>;
      
      public function FilterConvolution(param1:uint)
      {
         super(param1);
         this._matrix = new Vector.<Number>();
      }
      
      public function get matrix() : Vector.<Number>
      {
         return this._matrix;
      }
      
      override public function get filter() : BitmapFilter
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._matrix.length)
         {
            _loc1_.push(this._matrix[_loc2_]);
            _loc2_++;
         }
         return new ConvolutionFilter(this.matrixX,this.matrixY,_loc1_,this.divisor,this.bias,this.preserveAlpha,this.clamp,ColorUtils.rgb(this.defaultColor),ColorUtils.alpha(this.defaultColor));
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.matrixX = param1.readUI8();
         this.matrixY = param1.readUI8();
         this.divisor = param1.readFLOAT();
         this.bias = param1.readFLOAT();
         var _loc2_:uint = this.matrixX * this.matrixY;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this.matrix.push(param1.readFLOAT());
            _loc3_++;
         }
         this.defaultColor = param1.readRGBA();
         var _loc4_:uint = param1.readUI8();
         this.clamp = (_loc4_ & 2) != 0;
         this.preserveAlpha = (_loc4_ & 1) != 0;
      }
      
      override public function publish(param1:SWFData) : void
      {
         param1.writeUI8(this.matrixX);
         param1.writeUI8(this.matrixY);
         param1.writeFLOAT(this.divisor);
         param1.writeFLOAT(this.bias);
         var _loc2_:uint = this.matrixX * this.matrixY;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeFLOAT(this.matrix[_loc3_]);
            _loc3_++;
         }
         param1.writeRGBA(this.defaultColor);
         var _loc4_:uint = 0;
         if(this.clamp)
         {
            _loc4_ |= 2;
         }
         if(this.preserveAlpha)
         {
            _loc4_ |= 1;
         }
         param1.writeUI8(_loc4_);
      }
      
      override public function clone() : IFilter
      {
         var _loc1_:FilterConvolution = new FilterConvolution(id);
         _loc1_.matrixX = this.matrixX;
         _loc1_.matrixY = this.matrixY;
         _loc1_.divisor = this.divisor;
         _loc1_.bias = this.bias;
         var _loc2_:uint = this.matrixX * this.matrixY;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.matrix.push(this.matrix[_loc3_]);
            _loc3_++;
         }
         _loc1_.defaultColor = this.defaultColor;
         _loc1_.clamp = this.clamp;
         _loc1_.preserveAlpha = this.preserveAlpha;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc2_:String = "[ConvolutionFilter] " + "DefaultColor: " + ColorUtils.rgbToString(this.defaultColor) + ", " + "Divisor: " + this.divisor + ", " + "Bias: " + this.bias;
         var _loc3_:Array = [];
         if(this.clamp)
         {
            _loc3_.push("Clamp");
         }
         if(this.preserveAlpha)
         {
            _loc3_.push("PreserveAlpha");
         }
         if(_loc3_.length > 0)
         {
            _loc2_ += ", Flags: " + _loc3_.join(", ");
         }
         if(this.matrix.length > 0)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Matrix:";
            _loc4_ = 0;
            while(_loc4_ < this.matrixY)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "]";
               _loc5_ = 0;
               while(_loc5_ < this.matrixX)
               {
                  _loc2_ += (_loc5_ > 0 ? ", " : " ") + this.matrix[this.matrixX * _loc4_ + _loc5_];
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
   }
}

