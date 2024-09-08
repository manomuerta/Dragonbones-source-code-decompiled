package _127
{
   import _1045.Button;
   import _1045._1105;
   
   public class _169 extends Button
   {
      public var _2625:_1105;
      
      public var _2627:_1105;
      
      public var _2626:_1105;
      
      private var _2624:Object;
      
      private var _2628:Object;
      
      private var _2629:Object;
      
      public function _169()
      {
         super();
         this.skinName = _170;
      }
      
      public function set _2550(param1:Object) : void
      {
         this._2624 = param1;
         if(this._2625)
         {
            this._2625.source = this._2624;
         }
      }
      
      public function set _2552(param1:Object) : void
      {
         this._2628 = param1;
         if(this._2627)
         {
            this._2627.source = param1;
         }
      }
      
      public function set _2553(param1:Object) : void
      {
         this._2629 = param1;
         if(this._2626)
         {
            this._2626.source = param1;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2626)
         {
            this._2626.source = this._2629;
         }
         if(param2 == this._2625)
         {
            this._2625.source = this._2624;
         }
         if(param2 == this._2627)
         {
            this._2627.source = this._2628;
         }
      }
   }
}

