package _226
{
   import _51._77;
   import _93._92;
   
   public class _255 extends _92
   {
      public function _255()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._2942.weight;
      }
      
      public function _2893() : void
      {
         this._2942.weight = this._2991;
      }
      
      public function _2894() : void
      {
         _2212._2939();
         _2212._14422();
      }
      
      public function get _2942() : _77
      {
         return _2223._1897;
      }
      
      public function get _2991() : Number
      {
         return _2223.weight;
      }
   }
}

