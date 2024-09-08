package _226
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555._570;
   import _555._571;
   import _561._568;
   import _586._594;
   import _93._92;
   
   public class _15564 extends _92
   {
      public function _15564()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893(this.newName);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2893(this._2952);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this.displayVO._13228;
      }
      
      public function _2893(param1:String) : void
      {
         this.displayVO._13228 = param1;
      }
      
      public function _2894() : void
      {
         this._2853.refresh(this._1837);
         this._2880._2891();
         if(this._1837._2165)
         {
            this._3008.refresh(this._1837);
            this._4216.refresh();
         }
      }
      
      protected function get displayVO() : _70
      {
         return _2223._1897;
      }
      
      protected function get _1837() : _79
      {
         return this.displayVO._1760 as _79;
      }
      
      protected function get newName() : String
      {
         return _2223.name;
      }
      
      protected function get _2952() : String
      {
         return _2208;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      protected function get _4216() : _568
      {
         return _1407.getInstance(_568) as _568;
      }
   }
}

