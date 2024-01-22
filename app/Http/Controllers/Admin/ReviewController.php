<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Car\CheckCarRequest;
use App\Http\Requests\Api\Reviews\StoreReviewRequest;
use App\Http\Requests\Api\Reviews\UpdateReviewRequest;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ReviewResource;
use App\Models\Car;
use App\Models\CarPlate;
use App\Models\Review;
use App\Services\ReviewService;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    private $reviewService;

    public function __construct()
    {
        $this->reviewService = new ReviewService();
        $this->middleware('permission:review.read', ['only' => ['index']]);
        $this->middleware('permission:review.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:review.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:review.delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index(CheckCarRequest $request)
    {

    }
    /**
     * Display a listing of the resource.
     */
    public function reportReviews()
    {
        $reviews = $this->reviewService->getReportedData();
        return view('admin.pages.reviews.reported' , compact('reviews'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreReviewRequest $request)
    {

    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateReviewRequest $request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Review $review)
    {
        $review->delete();

        session()->flash('success', __('review deleted Successfully'));

        return back();    }


}
