package _14169
{
   import flash.geom.Matrix;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class _14168
   {
      private var _type:String;
      
      public var gradientUnits:String;
      
      public var transform:Matrix;
      
      public var spreadMethod:String;
      
      public var colors:Array;
      
      public var alphas:Array;
      
      public var ratios:Array;
      
      public function _14168(param1:String)
      {
         super();
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      final public function clone() : _14168
      {
         var _loc1_:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
         var _loc2_:_14168 = new _loc1_();
         this.copyTo(_loc2_);
         return _loc2_;
      }
      
      public function copyTo(param1:_14168) : void
      {
         param1.gradientUnits = this.gradientUnits;
         param1.transform = this.transform == null ? null : this.transform.clone();
         param1.spreadMethod = this.spreadMethod;
         param1.colors = this.colors == null ? null : this.colors.slice();
         param1.alphas = this.alphas == null ? null : this.alphas.slice();
         param1.ratios = this.ratios == null ? null : this.ratios.slice();
      }
   }
}

