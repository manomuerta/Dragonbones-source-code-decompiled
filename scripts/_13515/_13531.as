package _13515
{
   import _13505._13510;
   import _51._52;
   import _81._86;
   import _93._92;
   
   public class _13531 extends _92
   {
      public function _13531()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3402(this._2977);
      }
      
      override public function revert() : void
      {
         super.revert();
         if(this._2976)
         {
            this._3402(this._2976);
         }
         else
         {
            _2209._3395(this._1836);
         }
      }
      
      protected function _3402(param1:_86) : void
      {
         if(this._1836._2002)
         {
            this._1836._2002.copyFrom(param1);
         }
         else
         {
            this._1836._2002 = param1;
         }
         switch(this.flag)
         {
            case _13510.FLAG_TRANSLATE:
               this._1836._13657 = true;
               break;
            case _13510.FLAG_ROTATE:
               this._1836._13658 = true;
               break;
            case _13510.FLAG_SCALE:
               this._1836._13659 = true;
         }
         this._1836._2002._1738();
         _2209._3401(this._1836);
      }
      
      private function get _1836() : _52
      {
         return _2223._1836;
      }
      
      private function get _2977() : _86
      {
         return _2223._2977;
      }
      
      private function get _2976() : _86
      {
         return _2223._2976;
      }
      
      private function get flag() : String
      {
         return _2223.flag;
      }
   }
}

